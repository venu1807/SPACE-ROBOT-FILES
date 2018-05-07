%clc;
%clear all;

function dy = rigid_1(t,y)

x0=y(1); y0=y(2); th0=y(3); th1=y(4); th2=y(5); th3=y(6);
dx0=y(7); dy0=y(8); dth0=y(9); dth1=y(10); dth2=y(11); dth3=y(12);

%INPUT DATA

Ti=0;Tf=20;   %Time

m0=500;m1=10;m2=10;m3=10; l0=1;l1=1;l2=1;l3=1; lc0=.5*l0;lc1=.5*l1;lc2=.5*l2;lc3=.5*l3;
Izz0=83.61; Izz1=1.05; Izz2=1.05; Izz3=1.05;

fx0=0; fy0=0; tau0=0;

%%%%%%%%thin=[0.3803;   -0.6198;    1.2867;  pi-0.3803;   0.6198;    -1.2867];%60
%%%%%%%%thf=[-pi/4; -pi/4; -pi/4; pi+(pi/4); pi/4; pi/4;];

thin=[0.698; -1.571; 1.047];
thf=[-0.3275209183298752;-1.02677807237436;-0.6738184763886455;];
%thf=[-0.524; -1.393; -0.035];

vefi=[0;0;0]
veff=[0.2;-0.1;0]   
vef=vefi+((veff-vefi)*(t/Tf))

J1=zeros(3,2);
  
J2 =[ - l3*sin(th0 + th1 + th2 + th3) - l1*sin(th0 + th1) - lc0*sin(th0) - l2*sin(th0 + th1 + th2), - l3*sin(th0 + th1 + th2 + th3) - l1*sin(th0 + th1) - l2*sin(th0 + th1 + th2), - l3*sin(th0 + th1 + th2 + th3) - l2*sin(th0 + th1 + th2), -l3*sin(th0 + th1 + th2 + th3)
   l3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + lc0*cos(th0) + l2*cos(th0 + th1 + th2),   l3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + l2*cos(th0 + th1 + th2),   l3*cos(th0 + th1 + th2 + th3) + l2*cos(th0 + th1 + th2),  l3*cos(th0 + th1 + th2 + th3)];

J(1:3,1:2)=J1;
J(2:3,3:6)=J2;
J(1,3:6)=ones(1,4);

thdot=pinv(J)*vef
J*thdot
dthf=thdot(4:6,:)

% %Trajectry  %Velocity
% 
% s1=dthf(1)*Tf/(thf(1)-thin(1));
% a1=3*((-4*s1)+10);
% b1=4*((7*s1)-15);
% c1=5*((-3*s1)+6);
% 
%     dth1_d=((thf(1)-thin(1))/Tf)*((a1*((t/Tf)^2))+(b1*((t/Tf)^3))+(c1*((t/Tf)^4)));
%     th1_d=thin(1)+(thf(1)-thin(1))*(((a1/3)*((t/Tf)^3))+((b1/4)*((t/Tf)^4))+((c1/5)*((t/Tf)^5)));
%     
%     
% s2=dthf(2)*Tf/(thf(2)-thin(2));
% a2=3*((-4*s2)+10);
% b2=4*((7*s2)-15);
% c2=5*((-3*s2)+6);
% 
%     dth2_d=((thf(2)-thin(2))/Tf)*((a2*((t/Tf)^2))+(b2*((t/Tf)^3))+(c2*((t/Tf)^4)));
%     th2_d=thin(2)+(thf(2)-thin(2))*(((a2/3)*((t/Tf)^3))+((b2/4)*((t/Tf)^4))+((c2/5)*((t/Tf)^5)));
%    
% 
% s3=dthf(3)*Tf/(thf(3)-thin(3));
% a3=3*((-4*s3)+10);
% b3=4*((7*s3)-15);
% c3=5*((-3*s3)+6);
% 
%     dth3_d=((thf(3)-thin(3))/Tf)*((a3*((t/Tf)^2))+(b3*((t/Tf)^3))+(c3*((t/Tf)^4)));
%     th3_d=thin(3)+(thf(3)-thin(3))*(((a3/3)*((t/Tf)^3))+((b3/4)*((t/Tf)^4))+((c3/5)*((t/Tf)^5)));
%    
%CYCLOIDAL TRAJECTORY

th1_d=thin(1)+((thf(1)-thin(1))/Tf)*(t-(Tf/(2*pi))*sin((2*pi/Tf)*t));
    dth1_d=((thf(1)-thin(1))/Tf)*(1-cos((2*pi/Tf)*t));
    ddth1_d=(2*pi*(thf(1)-thin(1))/(Tf*Tf))*sin((2*pi/Tf)*t);

th2_d=thin(2)+((thf(2)-thin(2))/Tf)*(t-(Tf/(2*pi))*sin((2*pi/Tf)*t));
    dth2_d=((thf(2)-thin(2))/Tf)*(1-cos((2*pi/Tf)*t));
    ddth2_d=(2*pi*(thf(2)-thin(2))/(Tf*Tf))*sin((2*pi/Tf)*t);

th3_d=thin(3)+((thf(3)-thin(3))/Tf)*(t-(Tf/(2*pi))*sin((2*pi/Tf)*t));
    dth3_d=((thf(3)-thin(3))/Tf)*(1-cos((2*pi/Tf)*t));
    ddth3_d=(2*pi*(thf(3)-thin(3))/(Tf*Tf))*sin((2*pi/Tf)*t);


%ddth1_d=0;ddth2_d=0;ddth3_d=0;ddth4_d=0;ddth5_d=0;ddth6_d=0;

kp=49; kd=14;
tau1=-kp*(th1-th1_d)-kd*(dth1-dth1_d);  
tau2=-kp*(th2-th2_d)-kd*(dth2-dth2_d);
tau3=-kp*(th3-th3_d)-kd*(dth3-dth3_d);

F=[fx0; fy0; tau0; tau1; tau2; tau3];


M =[                                                                                                                                                                                              m0 + m1 + m2 + m3,                                                                                                                                                                                                            0,                                                                                                                                                    - (m2*(2*l1*sin(th0 + th1) + 2*lc0*sin(th0) + 2*lc2*sin(th0 + th1 + th2)))/2 - (m1*(2*lc1*sin(th0 + th1) + 2*lc0*sin(th0)))/2 - (m3*(2*lc3*sin(th0 + th1 + th2 + th3) + 2*l1*sin(th0 + th1) + 2*lc0*sin(th0) + 2*l2*sin(th0 + th1 + th2)))/2,                                                                                                                                                           - (m3*(2*lc3*sin(th0 + th1 + th2 + th3) + 2*l1*sin(th0 + th1) + 2*l2*sin(th0 + th1 + th2)))/2 - (m2*(2*l1*sin(th0 + th1) + 2*lc2*sin(th0 + th1 + th2)))/2 - lc1*m1*sin(th0 + th1),                                                                                                                           - (m3*(2*lc3*sin(th0 + th1 + th2 + th3) + 2*l2*sin(th0 + th1 + th2)))/2 - lc2*m2*sin(th0 + th1 + th2),                                                                -lc3*m3*sin(th0 + th1 + th2 + th3)
                                                                                                                                                                                                              0,                                                                                                                                                                                            m0 + m1 + m2 + m3,                                                                                                                                                      (m2*(2*l1*cos(th0 + th1) + 2*lc0*cos(th0) + 2*lc2*cos(th0 + th1 + th2)))/2 + (m1*(2*lc1*cos(th0 + th1) + 2*lc0*cos(th0)))/2 + (m3*(2*lc3*cos(th0 + th1 + th2 + th3) + 2*l1*cos(th0 + th1) + 2*lc0*cos(th0) + 2*l2*cos(th0 + th1 + th2)))/2,                                                                                                                                                             (m2*(2*l1*cos(th0 + th1) + 2*lc2*cos(th0 + th1 + th2)))/2 + (m3*(2*lc3*cos(th0 + th1 + th2 + th3) + 2*l1*cos(th0 + th1) + 2*l2*cos(th0 + th1 + th2)))/2 + lc1*m1*cos(th0 + th1),                                                                                                                             (m3*(2*lc3*cos(th0 + th1 + th2 + th3) + 2*l2*cos(th0 + th1 + th2)))/2 + lc2*m2*cos(th0 + th1 + th2),                                                                 lc3*m3*cos(th0 + th1 + th2 + th3)
 - m2*(l1*sin(th0 + th1) + lc0*sin(th0) + lc2*sin(th0 + th1 + th2)) - m1*(lc1*sin(th0 + th1) + lc0*sin(th0)) - m3*(lc3*sin(th0 + th1 + th2 + th3) + l1*sin(th0 + th1) + lc0*sin(th0) + l2*sin(th0 + th1 + th2)), m2*(l1*cos(th0 + th1) + lc0*cos(th0) + lc2*cos(th0 + th1 + th2)) + m1*(lc1*cos(th0 + th1) + lc0*cos(th0)) + m3*(lc3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + lc0*cos(th0) + l2*cos(th0 + th1 + th2)), Izz0 + Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc0^2*m1 + lc1^2*m1 + lc0^2*m2 + lc2^2*m2 + lc0^2*m3 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + 2*l2*lc0*m3*cos(th1 + th2) + 2*lc0*lc2*m2*cos(th1 + th2) + 2*l1*l2*m3*cos(th2) + 2*l1*lc0*m2*cos(th1) + 2*l1*lc2*m2*cos(th2) + 2*l1*lc0*m3*cos(th1) + 2*l2*lc3*m3*cos(th3) + 2*lc0*lc1*m1*cos(th1) + 2*lc0*lc3*m3*cos(th1 + th2 + th3), Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + 2*l1*l2*m3*cos(th2) + l1*lc0*m2*cos(th1) + 2*l1*lc2*m2*cos(th2) + l1*lc0*m3*cos(th1) + 2*l2*lc3*m3*cos(th3) + lc0*lc1*m1*cos(th1) + lc0*lc3*m3*cos(th1 + th2 + th3), Izz2 + Izz3 + l2^2*m3 + lc2^2*m2 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + l1*l2*m3*cos(th2) + l1*lc2*m2*cos(th2) + 2*l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3), Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3)
                                                - m3*(lc3*sin(th0 + th1 + th2 + th3) + l1*sin(th0 + th1) + l2*sin(th0 + th1 + th2)) - m2*(l1*sin(th0 + th1) + lc2*sin(th0 + th1 + th2)) - lc1*m1*sin(th0 + th1),                                                m2*(l1*cos(th0 + th1) + lc2*cos(th0 + th1 + th2)) + m3*(lc3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + l2*cos(th0 + th1 + th2)) + lc1*m1*cos(th0 + th1),                                                     Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + 2*l1*l2*m3*cos(th2) + l1*lc0*m2*cos(th1) + 2*l1*lc2*m2*cos(th2) + l1*lc0*m3*cos(th1) + 2*l2*lc3*m3*cos(th3) + lc0*lc1*m1*cos(th1) + lc0*lc3*m3*cos(th1 + th2 + th3),                                                                                                                                                          Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + 2*l1*l2*m3*cos(th2) + 2*l1*lc2*m2*cos(th2) + 2*l2*lc3*m3*cos(th3),                                                                                          m3*l2^2 + 2*m3*cos(th3)*l2*lc3 + l1*m3*cos(th2)*l2 + m2*lc2^2 + l1*m2*cos(th2)*lc2 + m3*lc3^2 + l1*m3*cos(th2 + th3)*lc3 + Izz2 + Izz3,                                   Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3)
                                                                                                                  - m3*(lc3*sin(th0 + th1 + th2 + th3) + l2*sin(th0 + th1 + th2)) - lc2*m2*sin(th0 + th1 + th2),                                                                                                                  m3*(lc3*cos(th0 + th1 + th2 + th3) + l2*cos(th0 + th1 + th2)) + lc2*m2*cos(th0 + th1 + th2),                                                                                                                                                                 Izz2 + Izz3 + l2^2*m3 + lc2^2*m2 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + l1*l2*m3*cos(th2) + l1*lc2*m2*cos(th2) + 2*l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3),                                                                                                                                                                                                      m3*l2^2 + 2*m3*cos(th3)*l2*lc3 + l1*m3*cos(th2)*l2 + m2*lc2^2 + l1*m2*cos(th2)*lc2 + m3*lc3^2 + l1*m3*cos(th2 + th3)*lc3 + Izz2 + Izz3,                                                                                                                                                              m3*l2^2 + 2*m3*cos(th3)*l2*lc3 + m2*lc2^2 + m3*lc3^2 + Izz2 + Izz3,                                                              m3*lc3^2 + l2*m3*cos(th3)*lc3 + Izz3
                                                                                                                                                                             -lc3*m3*sin(th0 + th1 + th2 + th3),                                                                                                                                                                            lc3*m3*cos(th0 + th1 + th2 + th3),                                                                                                                                                                                                                                                                                               Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3),                                                                                                                                                                                                                                                                             Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3),                                                                                                                                                                                            m3*lc3^2 + l2*m3*cos(th3)*lc3 + Izz3,                                                                                   m3*lc3^2 + Izz3];


C =[                                                                                                                                                                                                                                                    - dth0^2*l2*m3*cos(th0 + th1 + th2) - dth1^2*l2*m3*cos(th0 + th1 + th2) - dth2^2*l2*m3*cos(th0 + th1 + th2) - dth0^2*lc2*m2*cos(th0 + th1 + th2) - dth1^2*lc2*m2*cos(th0 + th1 + th2) - dth2^2*lc2*m2*cos(th0 + th1 + th2) - dth0^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth1^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth2^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth3^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth0^2*l1*m2*cos(th0 + th1) - dth1^2*l1*m2*cos(th0 + th1) - dth0^2*l1*m3*cos(th0 + th1) - dth1^2*l1*m3*cos(th0 + th1) - dth0^2*lc1*m1*cos(th0 + th1) - dth1^2*lc1*m1*cos(th0 + th1) - dth0^2*lc0*m1*cos(th0) - dth0^2*lc0*m2*cos(th0) - dth0^2*lc0*m3*cos(th0) - 2*dth0*dth1*l2*m3*cos(th0 + th1 + th2) - 2*dth0*dth2*l2*m3*cos(th0 + th1 + th2) - 2*dth1*dth2*l2*m3*cos(th0 + th1 + th2) - 2*dth0*dth1*lc2*m2*cos(th0 + th1 + th2) - 2*dth0*dth2*lc2*m2*cos(th0 + th1 + th2) - 2*dth1*dth2*lc2*m2*cos(th0 + th1 + th2) - 2*dth0*dth1*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth0*dth2*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth0*dth3*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth1*dth2*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth1*dth3*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth2*dth3*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth0*dth1*l1*m2*cos(th0 + th1) - 2*dth0*dth1*l1*m3*cos(th0 + th1) - 2*dth0*dth1*lc1*m1*cos(th0 + th1)
                                                                                                                                                                                                                                                    - dth0^2*l2*m3*sin(th0 + th1 + th2) - dth1^2*l2*m3*sin(th0 + th1 + th2) - dth2^2*l2*m3*sin(th0 + th1 + th2) - dth0^2*lc2*m2*sin(th0 + th1 + th2) - dth1^2*lc2*m2*sin(th0 + th1 + th2) - dth2^2*lc2*m2*sin(th0 + th1 + th2) - dth0^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth1^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth2^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth3^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth0^2*l1*m2*sin(th0 + th1) - dth1^2*l1*m2*sin(th0 + th1) - dth0^2*l1*m3*sin(th0 + th1) - dth1^2*l1*m3*sin(th0 + th1) - dth0^2*lc1*m1*sin(th0 + th1) - dth1^2*lc1*m1*sin(th0 + th1) - dth0^2*lc0*m1*sin(th0) - dth0^2*lc0*m2*sin(th0) - dth0^2*lc0*m3*sin(th0) - 2*dth0*dth1*l2*m3*sin(th0 + th1 + th2) - 2*dth0*dth2*l2*m3*sin(th0 + th1 + th2) - 2*dth1*dth2*l2*m3*sin(th0 + th1 + th2) - 2*dth0*dth1*lc2*m2*sin(th0 + th1 + th2) - 2*dth0*dth2*lc2*m2*sin(th0 + th1 + th2) - 2*dth1*dth2*lc2*m2*sin(th0 + th1 + th2) - 2*dth0*dth1*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth0*dth2*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth0*dth3*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth1*dth2*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth1*dth3*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth2*dth3*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth0*dth1*l1*m2*sin(th0 + th1) - 2*dth0*dth1*l1*m3*sin(th0 + th1) - 2*dth0*dth1*lc1*m1*sin(th0 + th1)
 - dth2^2*l1*lc3*m3*sin(th2 + th3) - dth3^2*l1*lc3*m3*sin(th2 + th3) - dth1^2*l2*lc0*m3*sin(th1 + th2) - dth2^2*l2*lc0*m3*sin(th1 + th2) - dth1^2*lc0*lc2*m2*sin(th1 + th2) - dth2^2*lc0*lc2*m2*sin(th1 + th2) - dth2^2*l1*l2*m3*sin(th2) - dth1^2*l1*lc0*m2*sin(th1) - dth2^2*l1*lc2*m2*sin(th2) - dth1^2*l1*lc0*m3*sin(th1) - dth3^2*l2*lc3*m3*sin(th3) - dth1^2*lc0*lc1*m1*sin(th1) - dth1^2*lc0*lc3*m3*sin(th1 + th2 + th3) - dth2^2*lc0*lc3*m3*sin(th1 + th2 + th3) - dth3^2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth2*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth1*l2*lc0*m3*sin(th1 + th2) - 2*dth0*dth2*l2*lc0*m3*sin(th1 + th2) - 2*dth1*dth2*l2*lc0*m3*sin(th1 + th2) - 2*dth0*dth1*lc0*lc2*m2*sin(th1 + th2) - 2*dth0*dth2*lc0*lc2*m2*sin(th1 + th2) - 2*dth1*dth2*lc0*lc2*m2*sin(th1 + th2) - 2*dth0*dth2*l1*l2*m3*sin(th2) - 2*dth1*dth2*l1*l2*m3*sin(th2) - 2*dth0*dth1*l1*lc0*m2*sin(th1) - 2*dth0*dth2*l1*lc2*m2*sin(th2) - 2*dth1*dth2*l1*lc2*m2*sin(th2) - 2*dth0*dth1*l1*lc0*m3*sin(th1) - 2*dth0*dth3*l2*lc3*m3*sin(th3) - 2*dth1*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3) - 2*dth0*dth1*lc0*lc1*m1*sin(th1) - 2*dth0*dth1*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth3*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth1*dth2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth1*dth3*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth2*dth3*lc0*lc3*m3*sin(th1 + th2 + th3)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               dth0^2*l2*lc0*m3*sin(th1 + th2) - dth3^2*l1*lc3*m3*sin(th2 + th3) - dth2^2*l1*lc3*m3*sin(th2 + th3) + dth0^2*lc0*lc2*m2*sin(th1 + th2) - dth2^2*l1*l2*m3*sin(th2) + dth0^2*l1*lc0*m2*sin(th1) - dth2^2*l1*lc2*m2*sin(th2) + dth0^2*l1*lc0*m3*sin(th1) - dth3^2*l2*lc3*m3*sin(th3) + dth0^2*lc0*lc1*m1*sin(th1) + dth0^2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth2*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth2*l1*l2*m3*sin(th2) - 2*dth1*dth2*l1*l2*m3*sin(th2) - 2*dth0*dth2*l1*lc2*m2*sin(th2) - 2*dth1*dth2*l1*lc2*m2*sin(th2) - 2*dth0*dth3*l2*lc3*m3*sin(th3) - 2*dth1*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          dth0^2*l1*lc3*m3*sin(th2 + th3) + dth1^2*l1*lc3*m3*sin(th2 + th3) + dth0^2*l2*lc0*m3*sin(th1 + th2) + dth0^2*lc0*lc2*m2*sin(th1 + th2) + dth0^2*l1*l2*m3*sin(th2) + dth1^2*l1*l2*m3*sin(th2) + dth0^2*l1*lc2*m2*sin(th2) + dth1^2*l1*lc2*m2*sin(th2) - dth3^2*l2*lc3*m3*sin(th3) + dth0^2*lc0*lc3*m3*sin(th1 + th2 + th3) + 2*dth0*dth1*l1*lc3*m3*sin(th2 + th3) + 2*dth0*dth1*l1*l2*m3*sin(th2) + 2*dth0*dth1*l1*lc2*m2*sin(th2) - 2*dth0*dth3*l2*lc3*m3*sin(th3) - 2*dth1*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   lc3*m3*(dth0^2*l1*sin(th2 + th3) + dth1^2*l1*sin(th2 + th3) + dth0^2*l2*sin(th3) + dth1^2*l2*sin(th3) + dth2^2*l2*sin(th3) + dth0^2*lc0*sin(th1 + th2 + th3) + 2*dth0*dth1*l1*sin(th2 + th3) + 2*dth0*dth1*l2*sin(th3) + 2*dth0*dth2*l2*sin(th3) + 2*dth1*dth2*l2*sin(th3))];
 Minv=inv(M);
                                                                                                                                             
ddq=Minv*(F-C);

ddx0=ddq(1);ddy0=ddq(2);ddth0=ddq(3);ddth1=ddq(4); ddth2=ddq(5);ddth3=ddq(6); 
dy = zeros(12,1);
dy(1)=dx0; dy(2)=dy0; dy(3)=dth0; dy(4)=dth1; dy(5)=dth2;dy(6)=dth3;dy(7)=ddx0; dy(8)=ddy0; dy(9)=ddth0; dy(10)=ddth1; dy(11)=ddth2;dy(12)=ddth3;
