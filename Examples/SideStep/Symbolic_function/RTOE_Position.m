function out1 = RTOE_Position(in1,in2,in3)
%RTOE_POSITION
%    OUT1 = RTOE_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    25-Nov-2020 09:54:42

R3cut1_1 = in3(19);
R3cut1_2 = in3(22);
R3cut1_3 = in3(25);
R3cut2_1 = in3(20);
R3cut2_2 = in3(23);
R3cut2_3 = in3(26);
R3cut3_1 = in3(21);
R3cut3_2 = in3(24);
R3cut3_3 = in3(27);
p3cut1 = in2(7);
p3cut2 = in2(8);
p3cut3 = in2(9);
q28 = in1(28,:);
t2 = cos(q28);
t3 = sin(q28);
out1 = [R3cut1_1.*1.756666666666667e-1+p3cut1-R3cut1_2.*t2.*4.486111111111113e-2-R3cut1_2.*t3.*4.722222222222222e-3+R3cut1_3.*t2.*4.722222222222222e-3-R3cut1_3.*t3.*4.486111111111113e-2;R3cut2_1.*1.756666666666667e-1+p3cut2-R3cut2_2.*t2.*4.486111111111113e-2-R3cut2_2.*t3.*4.722222222222222e-3+R3cut2_3.*t2.*4.722222222222222e-3-R3cut2_3.*t3.*4.486111111111113e-2;R3cut3_1.*1.756666666666667e-1+p3cut3-R3cut3_2.*t2.*4.486111111111113e-2-R3cut3_2.*t3.*4.722222222222222e-3+R3cut3_3.*t2.*4.722222222222222e-3-R3cut3_3.*t3.*4.486111111111113e-2];