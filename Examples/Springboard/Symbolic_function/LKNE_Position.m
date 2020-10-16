function out1 = LKNE_Position(in1,in2,in3)
%LKNE_POSITION
%    OUT1 = LKNE_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    12-Oct-2020 11:53:23

R1cut1_1 = in3(1);
R1cut1_2 = in3(4);
R1cut1_3 = in3(7);
R1cut2_1 = in3(2);
R1cut2_2 = in3(5);
R1cut2_3 = in3(8);
R1cut3_1 = in3(3);
R1cut3_2 = in3(6);
R1cut3_3 = in3(9);
p1cut1 = in2(1);
p1cut2 = in2(2);
p1cut3 = in2(3);
q1 = in1(1,:);
q23 = in1(23,:);
q24 = in1(24,:);
q25 = in1(25,:);
t2 = cos(q1);
t3 = cos(q23);
t4 = cos(q24);
t5 = cos(q25);
t6 = sin(q1);
t7 = sin(q23);
t8 = sin(q24);
t9 = sin(q25);
t10 = R1cut1_1.*t2;
t11 = R1cut1_2.*t2;
t12 = R1cut2_1.*t2;
t13 = R1cut2_2.*t2;
t14 = R1cut3_1.*t2;
t15 = R1cut3_2.*t2;
t16 = R1cut1_3.*t4;
t17 = R1cut2_3.*t4;
t18 = R1cut3_3.*t4;
t19 = R1cut1_1.*t6;
t20 = R1cut1_2.*t6;
t21 = R1cut2_1.*t6;
t22 = R1cut2_2.*t6;
t23 = R1cut3_1.*t6;
t24 = R1cut3_2.*t6;
t25 = -t16;
t26 = -t17;
t27 = -t18;
t28 = -t19;
t29 = -t21;
t30 = -t23;
t31 = t10+t20;
t32 = t12+t22;
t33 = t14+t24;
t34 = t11+t28;
t35 = t13+t29;
t36 = t15+t30;
t37 = t3.*t31;
t38 = t3.*t32;
t39 = t3.*t33;
t40 = t7.*t31;
t41 = t7.*t32;
t42 = t7.*t33;
t43 = t3.*t34;
t44 = t3.*t35;
t45 = t3.*t36;
t46 = t7.*t34;
t47 = -t40;
t48 = t7.*t35;
t49 = -t41;
t50 = t7.*t36;
t51 = -t42;
t52 = t37+t46;
t53 = t38+t48;
t54 = t39+t50;
t55 = t43+t47;
t56 = t44+t49;
t57 = t45+t51;
t58 = -t8.*(t40-t43);
t59 = -t8.*(t41-t44);
t60 = -t8.*(t42-t45);
t61 = t25+t58;
t62 = t26+t59;
t63 = t27+t60;
out1 = [R1cut1_3.*(-7.57570255340794e-2)+p1cut1-t10.*7.575702553407941e-3-t11.*4.734814095879963e-2+t19.*4.734814095879963e-2-t20.*7.575702553407941e-3-t5.*(t16+t8.*(t40-t43)).*6.854550732253128e-2+t9.*(t16+t8.*(t40-t43)).*1.936457530839127e-2-R1cut1_3.*t8.*4.385034509537274e-1-t5.*t52.*1.936457530839127e-2-t9.*t52.*6.854550732253128e-2+t4.*(t40-t43).*4.385034509537274e-1;R1cut2_3.*(-7.57570255340794e-2)+p1cut2-t12.*7.575702553407941e-3-t13.*4.734814095879963e-2+t21.*4.734814095879963e-2-t22.*7.575702553407941e-3-t5.*(t17+t8.*(t41-t44)).*6.854550732253128e-2+t9.*(t17+t8.*(t41-t44)).*1.936457530839127e-2-R1cut2_3.*t8.*4.385034509537274e-1-t5.*t53.*1.936457530839127e-2-t9.*t53.*6.854550732253128e-2+t4.*(t41-t44).*4.385034509537274e-1;R1cut3_3.*(-7.57570255340794e-2)+p1cut3-t14.*7.575702553407941e-3-t15.*4.734814095879963e-2+t23.*4.734814095879963e-2-t24.*7.575702553407941e-3-t5.*(t18+t8.*(t42-t45)).*6.854550732253128e-2+t9.*(t18+t8.*(t42-t45)).*1.936457530839127e-2-R1cut3_3.*t8.*4.385034509537274e-1-t5.*t54.*1.936457530839127e-2-t9.*t54.*6.854550732253128e-2+t4.*(t42-t45).*4.385034509537274e-1];
