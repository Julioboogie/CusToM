function diff=fctcout_IOmove(x,BiomechanicalModel,num_muscle,Regression,nb_points,involved_solids,num_markersprov,lambda)



mac=[];
ideal_curve=[];

mac=[mac momentarmcurve(x,BiomechanicalModel,num_muscle,Regression,nb_points,'R',involved_solids,num_markersprov)];

for j=1:size(Regression,2)
    if Regression(j).equation==1
        joint_name=Regression(j).primaryjoint;
        [~,joint_num]=intersect({BiomechanicalModel.OsteoArticularModel.name},['R', joint_name]);
        rangeq=linspace(BiomechanicalModel.OsteoArticularModel(joint_num).limit_inf,BiomechanicalModel.OsteoArticularModel(joint_num).limit_sup,nb_points);
        ideal_curve=[ideal_curve polyval(flip(Regression(j).coeffs),rangeq)];
        
    else
        if Regression(j).equation==2
            
            joint_name1=Regression(j).primaryjoint;
            joint_name2=Regression(j).secondaryjoint;
            [~,joint_num1]=intersect({BiomechanicalModel.OsteoArticularModel.name},['R',joint_name1]);
            [~,joint_num2]=intersect({BiomechanicalModel.OsteoArticularModel.name},['R',joint_name2]);
            rangeq1=linspace(BiomechanicalModel.OsteoArticularModel(joint_num1).limit_inf,BiomechanicalModel.OsteoArticularModel(joint_num1).limit_sup,nb_points);
            rangeq2=linspace(BiomechanicalModel.OsteoArticularModel(joint_num2).limit_inf,BiomechanicalModel.OsteoArticularModel(joint_num2).limit_sup,nb_points);
            
            
            [X,Y]=meshgrid(rangeq1,rangeq2);
            Xline=X(:);
            Yline=Y(:);
            for i=1:length(Xline)
                    ideal_curve=[ ideal_curve equation2(Regression(j).coeffs,Xline(i),Yline(i))];
            end
            
        else
            if Regression(j).equation==3
                joint_name1=Regression(j).primaryjoint;
                joint_name2=Regression(j).secondaryjoint;
                [~,joint_num1]=intersect({BiomechanicalModel.OsteoArticularModel.name},['R',joint_name1]);
                [~,joint_num2]=intersect({BiomechanicalModel.OsteoArticularModel.name},['r',joint_name2]);
                rangeq1=linspace(BiomechanicalModel.OsteoArticularModel(joint_num1).limit_inf,BiomechanicalModel.OsteoArticularModel(joint_num1).limit_sup,nb_points);
                rangeq2=linspace(BiomechanicalModel.OsteoArticularModel(joint_num2).limit_inf,BiomechanicalModel.OsteoArticularModel(joint_num2).limit_sup,nb_points);
                
                
                [X,Y]=meshgrid(rangeq1,rangeq2);
                Xline=X(:);
                Yline=Y(:);
                for i=1:length(Xline)
                        ideal_curve=[ ideal_curve equation2(Regression(j).coeffs,Xline(i),Yline(i))];
                end
                
            end
        end
    end
    
    
end
%
% figure()
% plot(mac)
% hold on
% plot(ideal_curve*1e-3)
% legend("Actuelle","Ce quon veut atteindre")


diff=norm((mac-ideal_curve*1e-3).^2,2)+ lambda*(sum(x(1:3).^2) + sum(x(end-2:end).^2)) ;



end