function out1 = RFWT_Position(in1,in2,in3)
%RFWT_POSITION
%    OUT1 = RFWT_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    01-Dec-2020 11:14:54

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
t2 = cos(q1);
t3 = sin(q1);
out1 = [R1cut1_3.*1.233119191035844e-1+p1cut1+R1cut1_1.*t2.*1.061881609872474e-1-R1cut1_1.*t3.*9.522435442542259e-3+R1cut1_2.*t2.*9.522435442542259e-3+R1cut1_2.*t3.*1.061881609872474e-1;R1cut2_3.*1.233119191035844e-1+p1cut2+R1cut2_1.*t2.*1.061881609872474e-1-R1cut2_1.*t3.*9.522435442542259e-3+R1cut2_2.*t2.*9.522435442542259e-3+R1cut2_2.*t3.*1.061881609872474e-1;R1cut3_3.*1.233119191035844e-1+p1cut3+R1cut3_1.*t2.*1.061881609872474e-1-R1cut3_1.*t3.*9.522435442542259e-3+R1cut3_2.*t2.*9.522435442542259e-3+R1cut3_2.*t3.*1.061881609872474e-1];