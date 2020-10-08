function [Muscles]=ArmMusclesPennestri(Muscles,Signe)
% Definition of an arm muscle model
%   This model contains 21 muscles
%
%	Based on:
%	- Pennestrì, E. , Stefanelli, R. , Valentini, P. P. , Vita, L.
%	Virtual musculo-skeletal model for the biomechanical
% analysis of the upper limb, Pennestrì2007
%   INPUT
%   - Muscles: set of muscles (see the Documentation for the structure)
%   - Signe: Signe of the arm model ('R' for right Signe or 'L' for left Signe)
%   OUTPUT
%   - Muscles: new set of muscles (see the Documentation for the structure)
%________________________________________________________
%
% Licence
% Toolbox distributed under GPL 3.0 Licence
%________________________________________________________
%
% Authors : Antoine Muller, Charles Pontonnier, Pierre Puchaud and
% Georges Dumont
%________________________________________________________


if strcmp(Signe,'Right')
    Signe = 'R';
else
    Signe = 'L';
end

s=cell(0);

s=[s;{
%     [Signe 'Coracobrachialis'],242.5,0.200,[],[],[],{[Signe 'Humerus_Coracobrachialis_o'];[Signe 'Thorax_Coracobrachialis_i']},{};...
%     [Signe 'Deltoid_pos'],259.9,0.170,[],[],[],{[Signe 'Humerus_Deltoid_o'];[Signe 'Thorax_Deltoid_i']},{};...
%     [Signe 'LatissimusDorsi'],1059,0.135,[],[],[],{[Signe 'Humerus_LatissimusDorsi_o'];[Signe 'Thorax_LatissimusDorsi_i']},{};...
 %   [Signe 'PectoralisMajor'],1270,0.190,[],[],[],{[Signe 'Humerus_PectoralisMajor_o'];[Signe 'Thorax_PectoralisMajor_i']},{};...
%     [Signe 'Supraspinatus'],487.8,0.090,[],[],[],{[Signe 'Humerus_Supraspinatus_o'];[Signe 'Thorax_Supraspinatus_i']},{};...
%     [Signe 'Infraspinatus'],1210,0.105,[],[],[],{[Signe 'Humerus_Infraspinatus_o'];[Signe 'Thorax_Infraspinatus_i']},{};...
    [Signe 'Trapezius'],240,0.1,[],[],[],{[Signe 'Humerus_Trapezius_o'];[Signe 'Thorax_Trapezius_i']},{};...        [Signe 'BicepsBrachii2'],47,0.23,[],[],[],{[Signe 'Humerus_BicepsBrachii2_o'];[Signe 'Thorax_BicepsBrachii2_i']},{};...
%   [Signe 'BicepsBrachii2'],435.6,0.23,[],[],[],{[Signe 'Humerus_BicepsBrachii2_o'];[Signe 'Thorax_BicepsBrachii2_i']},{};...  
 %  [Signe 'TricepsBrachii2'],1120,0.285,[],[],[],{[Signe 'Radius_TricepsBrachii2_o'];[Signe 'Humerus_TricepsBrachii_p1'];[Signe 'Thorax_TricepsBrachii2_i']},{};...%{['Wrap' Signe 'HumerusTri']};...
%   [Signe 'BicepsBrachii1'],624.3,0.27,[],[],[],{[Signe 'Ulna_BicepsBrachii1_o'];[Signe 'Thorax_BicepsBrachii1_i']},{};...
    [Signe 'Anconeus'],350,0.027,[],[],[],{[Signe 'Humerus_Anconeus_o'];[Signe 'Humerus_Anconeus_VP1'];[Signe 'Ulna_Anconeus_VP2'];[Signe 'Ulna_Anconeus_i']},{};...
  % [Signe 'TricepsBrachii1'],936.3,0.21,[],[],[],{[Signe 'Humerus_TricepsBrachii1_o'];[Signe 'Humerus_TricepsBrachii_p1'];[Signe 'Ulna_TricepsBrachii1_i']},{};...%{['Wrap' Signe 'HumerusTri']};...
 %   [Signe 'CubitalisAnterior'],35,0.255,[],[],[],{[Signe 'Humerus_CubitalisAnterior_o'];[Signe 'Hand_CubitalisAnterior_i']},{};...
    [Signe 'FlexorCarpiUlnaris'],128.9,0.051,[],[],[],{[Signe 'Humerus_FlexorCarpiUlnaris_o'];[Signe 'Humerus_FlexorCarpiUlnaris_VP1'];[Signe 'Radius_FlexorCarpiUlnaris_VP2'];[Signe 'Radius_FlexorCarpiUlnaris_VP3'];[Signe 'Hand_FlexorCarpiUlnaris_VP4'];[Signe 'Hand_FlexorCarpiUlnaris_i']},{};...
    [Signe 'ExtensorCarpiUlnaris'],93.2,0.062,[],[],[],{[Signe 'Humerus_ExtensorCarpiUlnaris_o'];[Signe 'Humerus_ExtensorCarpiUlnaris_VP1'];[Signe 'Radius_ExtensorCarpiUlnaris_VP2'];[Signe 'Radius_ExtensorCarpiUlnaris_VP3'];[Signe 'Hand_ExtensorCarpiUlnaris_VP4'];[Signe 'Hand_ExtensorCarpiUlnaris_i']},{};...
   [Signe 'ExtensorCarpiRadialisLongus'],304.9,0.081,[],0.244,[],{[Signe 'Humerus_ExtensorCarpiRadialisLongus_o'];[Signe 'Humerus_ExtensorCarpiRadialisLongus_VP1'];[Signe 'Radius_ExtensorCarpiRadialisLongus_VP2'];[Signe 'Radius_ExtensorCarpiRadialisLongus_VP3'];[Signe 'Hand_ExtensorCarpiRadialisLongus_VP4'];[Signe 'Hand_ExtensorCarpiRadialisLongus_i']},{};...
    [Signe 'ExtensorCarpiRadialisBrevis'],100.5,0.059,[],0.2223,[],{[Signe 'Humerus_ExtensorCarpiRadialisBrevis_o'];[Signe 'Humerus_ExtensorCarpiRadialisBrevis_VP1'];[Signe 'Radius_ExtensorCarpiRadialisBrevis_VP2'];[Signe 'Radius_ExtensorCarpiRadialisBrevis_VP3'];[Signe 'Hand_ExtensorCarpiRadialisBrevis_VP4'];[Signe 'Hand_ExtensorCarpiRadialisBrevis_i']},{};...
    % [Signe 'ExtensorDigitorum'],46,0.225,[],[],[],{[Signe 'Humerus_ExtensorDigitorum_o'];[Signe 'Hand_ExtensorDigitorum_i']},{};...
   % [Signe 'FlexorDigitorumSuperior'],45,0.220,[],[],[],{[Signe 'Humerus_FlexorDigitorumSuperior_o'];[Signe 'Hand_FlexorDigitorumSuperior_i']},{};...
    [Signe 'FlexorCarpiRadialis'],74,0.063,[],[],[],{[Signe 'Humerus_FlexorCarpiRadialis_o'];[Signe 'Humerus_FlexorCarpiRadialis_VP1'];[Signe 'Radius_FlexorCarpiRadialis_VP2'];[Signe 'Radius_FlexorCarpiRadialis_VP3'];[Signe 'Hand_FlexorCarpiRadialis_VP4'];[Signe 'Hand_FlexorCarpiRadialis_i']},{};...
    [Signe 'PronatorQuadratus'],75.5,0.028,[],[],[],{[Signe 'Radius_PronatorQuadratus_o'];[Signe 'Radius_PronatorQuadratus_VP1'];[Signe 'Ulna_PronatorQuadratus_VP2'];[Signe 'Ulna_PronatorQuadratus_i']},{};...
    [Signe 'SupinatorBrevis'],476,0.033,[],[],[],{[Signe 'Radius_SupinatorBrevis_o'];[Signe 'Radius_SupinatorBrevis_VP1'];[Signe 'Ulna_SupinatorBrevis_VP2'];[Signe 'Ulna_SupinatorBrevis_i']},{};...
 %   [Signe 'AbductorDigitiV'],36,0.140,[],[],[],{[Signe 'Ulna_AbductorDigitiV_o'];[Signe 'Hand_AbductorDigitiV_i']},{};...    
    [Signe 'Brachialis'],987.3,0.086,4,0.0535,0,{[Signe 'Humerus_Brachialis_o'];[Signe 'Humerus_Brachialis_VP1'];[Signe 'Ulna_Brachialis_VP2'];[Signe 'Ulna_Brachialis_i']},{};...
    [Signe 'Brachioradialis'],261.3,0.173,[],[],[],{[Signe 'Humerus_Brachioradialis_o'];[Signe 'Humerus_Brachioradialis_VP1'];[Signe 'Radius_Brachioradialis_VP2'];[Signe 'Radius_Brachioradialis_i']},{};...
    [Signe 'PronatorTeres'],566.2,0.049,[],[],[],{[Signe 'Humerus_PronatorTeres_o'];[Signe 'Humerus_PronatorTeres_VP1'];[Signe 'Radius_PronatorTeres_VP2'];[Signe 'Radius_PronatorTeres_i']},{};...
    [Signe 'TricepsLat'],624.3,0.114,4,0.098,0.157,{[Signe 'Humerus_TricepsLat_o'];[Signe 'Humerus_TricepsLat_VP1'];[Signe 'Ulna_TricepsLat_VP2'];[Signe 'Ulna_TricepsLat_i']},{};... 
    [Signe 'TricepsMed'],624.3,0.114,4,0.098,0.157,{[Signe 'Humerus_TricepsMed_o'];[Signe 'Humerus_TricepsMed_VP1'];[Signe 'Ulna_TricepsMed_VP2'];[Signe 'Ulna_TricepsMed_i']},{};... arm26.osim
    [Signe 'PalmarisLongus'],26.7,0.064,4,0.098,0.157,{[Signe 'Humerus_PalmarisLongus_o'];[Signe 'Humerus_PalmarisLongus_VP1'];[Signe 'Radius_PalmarisLongus_VP2'];[Signe 'Radius_PalmarisLongus_VP3'];[Signe 'Hand_PalmarisLongus_VP4'];[Signe 'Hand_PalmarisLongus_i']},{};...

    
    
    % Fake muscles from (Seth et al., 2016)
    [Signe 'Deltoid_ant'],1218.9,0.0976,[],0.093,0.38397,{[Signe 'humerus_r_DELT1_r-P1'];[Signe 'humerus_r_DELT1_r-P1'];[Signe 'Scapula_DELT1-P3'];[Signe 'clavicle_r_DELT1_r-P4']},{};...{['Wrap' Signe 'HumerusDelt']};... 
    [Signe 'Deltoid_mid'],1103.5,0.1078,[],0.1095,0.2618,{[Signe 'humerus_r_DELT2_r-P1'];[Signe 'Scapula_DELT2-P3'];[Signe 'Scapula_DELT2-P4']},{};...{['Wrap' Signe 'ThoraxGH']};...   
    [Signe 'Deltoid_pos'],201.6,0.1367,[],0.038,0.31416,{[Signe 'Scapula_DELT3-P1'];[Signe 'Scapula_DELT3-P2'];[Signe 'humerus_r_DELT3_r-P3']},{};...
    [Signe 'Lat_1'],290.5,0.254,[],0.12,0.43633,{[Signe 'humerus_r_LAT1_r-P1'];[Signe 'Scapula_LAT1-P2'];[Signe 'Scapula_LAT1-P3'];[Signe 'Thorax_LAT1-P4'];[Signe 'Thorax_LAT1-P5']},{};...{['Wrap' Signe 'HumerusLat']};...
    [Signe 'Lat_2'],317.5,0.2324,[],0.1765,0.33161,{[Signe 'humerus_r_LAT2_r-P1'];[Signe 'Scapula_LAT2-P2'];[Signe 'Scapula_LAT2-P3'];[Signe 'Thorax_LAT2-P4'];[Signe 'Thorax_LAT2-P5']},{};...{['Wrap' Signe 'HumerusLat']};...
    [Signe 'Lat_3'],189,0.2789,[],0.1403,0.36652,{[Signe 'humerus_r_LAT3_r-P1'];[Signe 'Scapula_LAT3-P2'];[Signe 'Scapula_LAT3-P3'];[Signe 'Thorax_LAT3-P4'];[Signe 'Thorax_LAT3-P5']},{};...{['Wrap' Signe 'HumerusLat']};...
    [Signe 'PECM1'],444.3,0.1442,[],0.0028,0.29671,{[Signe 'humerus_r_PECM1_r-P1'];[Signe 'humerus_r_PECM1_r-P2'];[Signe 'Thorax_PECM1-P3'];[Signe 'clavicle_r_PECM1_r-P4']},{};...
    [Signe 'PECM2'],658.3,0.1385,[],0.089,0.45379,{[Signe 'humerus_r_PECM2_r-P1'];[Signe 'humerus_r_PECM2_r-P2'];[Signe 'Thorax_PECM2-P3'];[Signe 'Thorax_PECM2-P4'];[Signe 'Thorax_PECM2-P5']},{};... 
    [Signe 'PECM3'],498.1,0.1385,[],0.132,0.43633,{[Signe 'humerus_r_PECM3_r-P1'];[Signe 'humerus_r_PECM3_r-P2'];[Signe 'Thorax_PECM3-P3'];[Signe 'Thorax_PECM3-P4'];[Signe 'Thorax_PECM3-P5']},{};... 
    [Signe 'Infraspinatus'],1075.8,0.0755,[],0.0308,0.33161,{[Signe 'humerus_INFSP-P1'];[Signe 'Scapula_INFSP-P2']},{};...
    [Signe 'Supraspinatus'],499.2,0.0682,[],0.0395,0.12217,{[Signe 'humerus_SUPSP-P1'];[Signe 'Scapula_SUPSP-P2'];[Signe 'Scapula_SUPSP-P3']},{};...
    [Signe 'Coracobrachialis'],208.2,0.0932,[],0.097,0.47124,{[Signe 'Scapula_CORB-P1'];[Signe 'Scapula_CORB-P2'];[Signe 'humerus_CORB-P3']},{};...
    
    
    %     % Conservation du modèle de Holzbaur
% on conserve les biceps du modèle de Holzbaur sauf qu'on part de la
    % scapula pour le biceps short et glénoïde pour le biceps long
     [Signe 'BicepsL'],624.3,0.1157,4,0.2723,0,{[Signe 'Scapula_BicepsL_o'];[Signe 'Scapula_BicepsL_via1'];[Signe 'Humerus_BicepsL_via2'];[Signe 'Humerus_BicepsL_via3'];[Signe 'Humerus_BicepsL_via4'];[Signe 'Humerus_BicepsL_via5'];[Signe 'Humerus_BicepsL_via6'];[Signe 'Humerus_Biceps_via7'];[Signe 'Ulna_Biceps_i']},{};... arm26.osim       
     [Signe 'BicepsS'],435.56,0.1321,4,0.1923,0,{[Signe 'Scapula_BicepsS_o'];[Signe 'Scapula_BicepsS_via1'];[Signe 'Humerus_BicepsS_via2'];[Signe 'Humerus_BicepsS_via3'];[Signe 'Humerus_Biceps_via7'];[Signe 'Ulna_Biceps_i']},{};... arm26.osim    
%     % on conserve les biceps du modèle de Holzbaur sauf qu'on part de la
%     % scapula pour le triceps long
%         [Signe 'TricepsLg'],798.5,0.134,4,0.143,0.209,{[Signe 'Scapula_Triceps_o'];[Signe 'Humerus_TricepsLg_via1'];[Signe 'Humerus_Triceps_via2'];[Signe 'Humerus_Triceps_via3'];[Signe 'Humerus_Triceps_via4'];[Signe 'Ulna_Triceps_via5'];[Signe 'Ulna_Triceps_i']},{};...       arm26.osim    
%      [Signe 'TricepsLat'],624.3,0.114,4,0.098,0.157,{[Signe 'Humerus_TricepsLat_o'];[Signe 'Humerus_TricepsLat_via1'];[Signe 'Humerus_Triceps_via2'];[Signe 'Humerus_Triceps_via3'];[Signe 'Humerus_Triceps_via4'];[Signe 'Ulna_Triceps_via5'];[Signe 'Ulna_Triceps_i']},{};... arm26.osim   
%      [Signe 'TricepsMed'],624.3,0.114,4,0.098,0.157,{[Signe 'Humerus_TricepsMed_o'];[Signe 'Humerus_TricepsMed_via1'];[Signe 'Humerus_Triceps_via2'];[Signe 'Humerus_Triceps_via3'];[Signe 'Humerus_Triceps_via4'];[Signe 'Ulna_Triceps_via5'];[Signe 'Ulna_Triceps_i']},{};... arm26.osim
  %         [Signe 'TricepsLg'],798.5,0.134,4,0.143,0.209,{[Signe 'Scapula_Triceps_o'];[Signe 'Humerus_TricepsLg_via1'];[Signe 'Humerus_Triceps_via2'];[Signe 'Humerus_Triceps_via3'];[Signe 'Humerus_Triceps_via4'];[Signe 'Ulna_Triceps_i']},{};...       arm26.osim    
%      [Signe 'TricepsLat'],624.3,0.114,4,0.098,0.157,{[Signe 'Humerus_TricepsLat_o'];[Signe 'Humerus_TricepsLat_via1'];[Signe 'Humerus_Triceps_via2'];[Signe 'Humerus_Triceps_via3'];[Signe 'Humerus_Triceps_via4'];[Signe 'Ulna_Triceps_i']},{};... arm26.osim   
%      [Signe 'TricepsMed'],624.3,0.114,4,0.098,0.157,{[Signe 'Humerus_TricepsMed_o'];[Signe 'Humerus_TricepsMed_via1'];[Signe 'Humerus_Triceps_via2'];[Signe 'Humerus_Triceps_via3'];[Signe 'Humerus_Triceps_via4'];[Signe 'Ulna_Triceps_i']},{};... arm26.osim
        }];


% Structure generation
Muscles=[Muscles;struct('name',{s{:,1}}','f0',{s{:,2}}','l0',{s{:,3}}',...
    'Kt',{s{:,4}}','ls',{s{:,5}}','alpha0',{s{:,6}}','path',{s{:,7}}','wrap',{s{:,8}}')]; %#ok<CCAT1>
end