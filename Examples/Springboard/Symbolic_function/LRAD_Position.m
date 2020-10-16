function out1 = LRAD_Position(in1,in2,in3)
%LRAD_POSITION
%    OUT1 = LRAD_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    12-Oct-2020 11:53:45

R5cut1_1 = in3(37);
R5cut1_2 = in3(40);
R5cut1_3 = in3(43);
R5cut2_1 = in3(38);
R5cut2_2 = in3(41);
R5cut2_3 = in3(44);
R5cut3_1 = in3(39);
R5cut3_2 = in3(42);
R5cut3_3 = in3(45);
p5cut1 = in2(13);
p5cut2 = in2(14);
p5cut3 = in2(15);
q38 = in1(38,:);
q39 = in1(39,:);
t2 = cos(q38);
t3 = cos(q39);
t4 = sin(q38);
t5 = sin(q39);
t6 = R5cut1_1.*t2;
t7 = R5cut2_1.*t2;
t8 = R5cut3_1.*t2;
t9 = R5cut1_3.*t4;
t10 = R5cut2_3.*t4;
t11 = R5cut3_3.*t4;
t12 = -t9;
t13 = -t10;
t14 = -t11;
t15 = t6+t12;
t16 = t7+t13;
t17 = t8+t14;
out1 = [R5cut1_2.*(-3.056486041994485e-1)+p5cut1-R5cut1_1.*t4.*3.857084127071893e-2+R5cut1_2.*t3.*1.572031119692383e-3-R5cut1_3.*t2.*3.857084127071893e-2+R5cut1_2.*t5.*1.466186344892119e-2+t3.*t15.*1.466186344892119e-2-t5.*t15.*1.572031119692383e-3;R5cut2_2.*(-3.056486041994485e-1)+p5cut2-R5cut2_1.*t4.*3.857084127071893e-2+R5cut2_2.*t3.*1.572031119692383e-3-R5cut2_3.*t2.*3.857084127071893e-2+R5cut2_2.*t5.*1.466186344892119e-2+t3.*t16.*1.466186344892119e-2-t5.*t16.*1.572031119692383e-3;R5cut3_2.*(-3.056486041994485e-1)+p5cut3-R5cut3_1.*t4.*3.857084127071893e-2+R5cut3_2.*t3.*1.572031119692383e-3-R5cut3_3.*t2.*3.857084127071893e-2+R5cut3_2.*t5.*1.466186344892119e-2+t3.*t17.*1.466186344892119e-2-t5.*t17.*1.572031119692383e-3];
