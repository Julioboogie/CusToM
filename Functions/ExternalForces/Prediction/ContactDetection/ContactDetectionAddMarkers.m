function [Contact_detection, Num] = ContactDetectionAddMarkers(filename, AnalysisParameters, Human_model)
% Contact detection for ground reaction forces for unconventional floors requiring additional markers
%
%   INPUT
%   - filename: name of the file to process (character string)
%   - AnalysisParameters: parameters of the musculoskeletal analysis,
%   automatically generated by the graphic interface 'Analysis' 
%   - BiomechanicalModel: musculoskeletal model
%   - ModelParameters: parameters of the musculoskeletal model, automatically
%   generated by the graphic interface 'GenerateParameters' 
%   OUTPUT
%   - ExternalForcesComputationResults: results of the external forces
%   computation (see the Documentation for the structure)
%________________________________________________________
%
% Licence
% Toolbox distributed under GPL 3.0 Licence
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud, Louise Demestre and
% Georges Dumont
%________________________________________________________

%% Loading data
load([filename '/InverseKinematicsResults.mat']); %#ok<LOAD>
q = InverseKinematicsResults.JointCoordinates';
if isfield(InverseKinematicsResults,'FreeJointCoordinates')
    q6dof = InverseKinematicsResults.FreeJointCoordinates';
else
    PelvisPosition = InverseKinematicsResults.PelvisPosition;
    PelvisOrientation = InverseKinematicsResults.PelvisOrientation;
end        
load([filename '/ExperimentalData.mat']); %#ok<LOAD>
time = ExperimentalData.Time;

freq=1/time(2);

%% Creation of a structure to add contact points
for i=1:numel(AnalysisParameters.Prediction.ContactPoint)
    Prediction(i).points_prediction_efforts = AnalysisParameters.Prediction.ContactPoint{i}; %#ok<AGROW>
end
Prediction=verif_Prediction_Humanmodel(Human_model,Prediction);
NbPointsPrediction = numel(Prediction);

%% get rid of the 6DOF joint
if isfield(InverseKinematicsResults,'FreeJointCoordinates')
    Human_model(Human_model(end).child).mother = 0;
    Human_model=Human_model(1:(numel(Human_model)-6));
end

dt=1/freq;
dq=derivee2(dt,q);  % vitesses
ddq=derivee2(dt,dq);  % acc�l�rations

%% Loading structure data
acq = btkReadAcquisition(AnalysisParameters.Prediction.ReferenceFile);
markers = btkGetMarkers(acq);
markers_list = fieldnames(markers);
nbr_markers = length(markers_list);
[real_markers, nbframe]=C3dProcessedData(filename, markers_list); %Dernier marqueur --> pour cr�er Y2
real_markers = rmfield(real_markers,'time');

% Filtrage (Filtering)
f_cut = AnalysisParameters.Prediction.FilterCutOff;
if AnalysisParameters.General.FilterActive
    for i=1:numel(real_markers)
    	real_markers(i).position = filt_data(real_markers(i).position_c3d,f_cut,freq);
    end
else
    for i=1:numel(real_markers)
    	real_markers(i).position = real_markers(i).position_c3d;
    end
end
real_markers = rmfield(real_markers,'position_c3d');

%% Contact detection initialization
Contact_detection = zeros(NbPointsPrediction, nbframe);

%% D�finition des donn�es cin�matiques du pelvis
% (position / vitesse / acc�l�ration / orientation / vitesse angulaire / acc�l�ration angulaire)
% Kinematical data for Pelvis (Position/speed/acceleration/angles/angular speed/angular acceleration)

if isfield(InverseKinematicsResults,'FreeJointCoordinates')
    p_pelvis=q6dof(:,1:3);  % frame i : p_pelvis(i,:)
    r_pelvis=cell(size(q6dof,1),1);
    for i=1:size(q6dof,1)
        r_pelvis{i}=Rodrigues([1 0 0]',q6dof(i,4))*Rodrigues([0 1 0]',q6dof(i,5))*Rodrigues([0 0 1]',q6dof(i,6)); % matrice de rotation en fonction des rotations successives (x,y,z) : frame i : r_pelvis{i}
    end
else
    p_pelvis = cell2mat(PelvisPosition)';
    r_pelvis  = PelvisOrientation';
end

%dR
dR=zeros(3,3,nbframe);
for ligne=1:3
    for colonne=1:3
        dR(ligne,colonne,:)=derivee2(dt,cell2mat(cellfun(@(b) b(ligne,colonne),r_pelvis,'UniformOutput',false)));
    end
end
w=zeros(nbframe,3);
for i=1:nbframe
    wmat=dR(:,:,i)*r_pelvis{i}';
    w(i,:)=[wmat(3,2),wmat(1,3),wmat(2,1)];
end

% v0
v=derivee2(dt,p_pelvis);
vw=zeros(nbframe,3);
for i=1:nbframe
    vw(i,:)=cross(p_pelvis(i,:),w(i,:));
end
v0=v+vw;

% dv0
dv0=derivee2(dt,v0);

% dw
dw=derivee2(dt,w);


%% Calcul frame par frame de la position, vitesse, acc�l�ration des deux rep�res
good_marker1=zeros(nbframe,6); % Coordonn�es des marqueurs � chaque extr�mit� de la surface de contact pour chaque frame dans le rep�re monde
vitesse_good_marker=zeros(nbframe,3); % Vitesses selon les axes X/Y/Z de l'origine du rep�re mobile exprim� dans le rep�re monde
PositionThreshold = AnalysisParameters.Prediction.PositionThreshold;
VelocityThreshold = AnalysisParameters.Prediction.VelocityThreshold;
Offset = AnalysisParameters.Prediction.Offset;

for i=1:nbframe
    %attribution � chaque articulation de la position/vitesse/acc�l�ration (position/speed/acceleration for each joint)
    Human_model(1).p=p_pelvis(i,:)';
    Human_model(1).R=r_pelvis{i};
    Human_model(1).v0=v0(i,:)';
    Human_model(1).w=w(i,:)';
    Human_model(1).dv0=dv0(i,:)';
    Human_model(1).dw=dw(i,:)';
    for j=2:numel(Human_model)
        Human_model(j).q=q(i,j); %#ok<*SAGROW>
        Human_model(j).dq=dq(i,j);
        Human_model(j).ddq=ddq(i,j);
    end
    % Calcul positions / vitesses / acc�l�ration de chaque solide (computation of position/speed/acceleration for each solid)
    [Human_model,Prediction] = ForwardAllKinematicsPrediction(Human_model,Prediction,1); 
    %% Calcul dun nouveau r�f�rentiel
    proches_marker=[]; % Matrice contenant tous les marqueurs de la structure correpondant � la surface de contact avec le pied
    num_proches_marker=[]; % Vecteur contenant les num�ros des marqueurs de la structure en contact pour chaque point de contact
    distance = zeros(NbPointsPrediction,1); % Vecteur contenant les distances entre les marqueurs retenus et les point de contact consid�r�s
    for pred = 1:NbPointsPrediction
        %Position et vitesse selon les axes X/Y/Z de chaque point de contact dans le rep�re monde � la frame i
        Prediction(pred).px(i)=Prediction(pred).pos_anim(1);
        Prediction(pred).py(i)=Prediction(pred).pos_anim(2);
        Prediction(pred).pz(i)=Prediction(pred).pos_anim(3);
        Prediction(pred).vx(i)=Prediction(pred).vitesse(1);
        Prediction(pred).vy(i)=Prediction(pred).vitesse(2);
        Prediction(pred).vz(i)=Prediction(pred).vitesse(3);
        
        DetectionAxis = real_markers(end-1).position(i,:)-real_markers(1).position(i,:); %D�tection selon l'axe de la structure
        ContactPoint = [Prediction(pred).px(i) Prediction(pred).py(i) Prediction(pred).pz(i)]; %Position absolue du point de contact consid�r�
        vect1 = ContactPoint-real_markers(1).position(i,:); %Vecteur entre le point de contact et le premier marqueur
        distance(pred) = dot(vect1,DetectionAxis)/norm(DetectionAxis);
        
        good_marker_provisoire=real_markers(1).position(i,1:3); 
           for k =2:nbr_markers-1 %Recherche du marqueur de la structure le plus proche selon DetectionAxis pour chaque point de prediction
               vect = ContactPoint-real_markers(k).position(i,:);
               if abs(dot(vect,DetectionAxis)/norm(DetectionAxis))<distance(pred)
                   distance(pred) = dot(vect,DetectionAxis)/norm(DetectionAxis);
                   good_marker_provisoire=real_markers(k).position(i,1:3); %Coordonn�es X/Y/Z du marqueur rep�r�
                   num_good_marker_provisoire=k;
               end
           end
           proches_marker=[proches_marker;good_marker_provisoire]; % Coordonn�es X/Y/Z (colonnes) de l'ensemble des marqueurs (lignes) en contact
           num_proches_marker=[num_proches_marker;num_good_marker_provisoire];  
    end    
    
    [~,ind_min] = min(distance);
    [~,ind_max] = max(distance);
    good_marker1(i,:)=[proches_marker(ind_min,:) proches_marker(ind_max,:)]; %Surface de contact d�finie par les deux marqueurs extr�mes pr�c�dents
    num_good_marker = num_proches_marker(ind_max);
    if i~=1
        vitesse_good_marker(i,:)=(real_markers(num_good_marker).position(i,1:3)-real_markers(num_good_marker).position(i-1,1:3))/(1/freq);
    end
    X2=good_marker1(i,4:6)-good_marker1(i,1:3); %Axe X2 orient� par les deux marqueurs aux extremit�s de la surface de contact consid�r�e
    X2=X2/norm(X2); 
    Y2 = real_markers(end).position(i,:)-real_markers(end-1).position(i,:); %Axe Y2 � partir de la position du premier marqueur
    width = norm(Y2);
    Y2 = Y2/width;
    Z2 = cross(X2,Y2);
    Z2 = Z2/norm(Z2);
    R21 = [X2' Y2' Z2'];
    T21 = [R21' -R21'*good_marker1(i,1:3)' ; 0 0 0 1]; %Matrice de transformation du rep�re monde au rep�re mobile
    
%% Threshold application
    for pred=1:NbPointsPrediction
        position_pred_2=T21*[Prediction(pred).px(i);Prediction(pred).py(i);Prediction(pred).pz(i);1]; %Position relative du point de contact par rapport � la structure
        difference_vitesse=sqrt((vitesse_good_marker(i,1)-Prediction(pred).vx(i))^2+(vitesse_good_marker(i,2)-Prediction(pred).vy(i))^2+(vitesse_good_marker(i,3)-Prediction(pred).vz(i))^2); %Norme de la vitesse relative du point de contact par rapport � la structure

        if 0<=position_pred_2(2) && position_pred_2(2)<=width && abs(position_pred_2(3))<=PositionThreshold+Offset && difference_vitesse<=VelocityThreshold
            Contact_detection(pred,i)=1;
        end
    end
    num_proches_markers = unique(num_proches_marker); 
    Num{i} = num2cell(num_proches_markers);
end

end