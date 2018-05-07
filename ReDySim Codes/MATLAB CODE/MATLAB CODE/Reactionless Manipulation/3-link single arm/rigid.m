%clc;
%clear all;

function dy = rigid(t,y)

x0=y(1); y0=y(2); th0=y(3); th1=y(4); th2=y(5); th3=y(6);
dx0=y(7); dy0=y(8); dth0=y(9); dth1=y(10); dth2=y(11); dth3=y(12);

phi1=y(13); phi2=y(14); phi3=y(15);

dy = zeros(15,1);

%INPUT DATA

Ti=0;Tf=30;

%[ddq]= accln()

m0=500;m1=10;m2=10;m3=10; l0=1;l1=1;l2=1;l3=1; lc0=.5*l0;lc1=.5*l1;lc2=.5*l2;lc3=.5*l3;  
Izz0=83.61; Izz1=1.05; Izz2=1.05; Izz3=1.05;

%syms th1 th2 dth1 dth2 tau1 tau2 tau3

fx0=0; fy0=0; tau0=0;

thin=[0.3803;   -0.6198;    1.2867];%60
thf=[1.3803; 0.6198; -2.867];


th1_d=thin(1)+((thf(1)-thin(1))/Tf)*(t-(Tf/(2*pi))*sin((2*pi/Tf)*t));
    dth1_d=((thf(1)-thin(1))/Tf)*(1-cos((2*pi/Tf)*t));
    ddth1_d=(2*pi*(thf(1)-thin(1))/(Tf*Tf))*sin((2*pi/Tf)*t);

th2_d=thin(2)+((thf(2)-thin(2))/Tf)*(t-(Tf/(2*pi))*sin((2*pi/Tf)*t));
    dth2_d=((thf(2)-thin(2))/Tf)*(1-cos((2*pi/Tf)*t));
    ddth2_d=(2*pi*(thf(2)-thin(2))/(Tf*Tf))*sin((2*pi/Tf)*t);

th3_d=thin(3)+((thf(3)-thin(3))/Tf)*(t-(Tf/(2*pi))*sin((2*pi/Tf)*t));
    dth3_d=((thf(3)-thin(3))/Tf)*(1-cos((2*pi/Tf)*t));
    ddth3_d=(2*pi*(thf(3)-thin(3))/(Tf*Tf))*sin((2*pi/Tf)*t);

    kp=49; kd=14;

%RM
 
HbmT =[ (5*cos(th1 + th2 + th3))/2 + (15*cos(th1 + th2))/2 + 10*cos(th2 + th3) + (25*cos(th1))/2 + 30*cos(th2) + 10*cos(th3) - (15*cos(th0 + th1 + th2) + 5*cos(th0 + th1 + th2 + th3) + 25*cos(th0 + th1))*((3*cos(th0 + th1 + th2))/106 + cos(th0 + th1 + th2 + th3)/106 + (5*cos(th0 + th1))/106 + (3*cos(th0))/106) - (15*sin(th0 + th1 + th2) + 5*sin(th0 + th1 + th2 + th3) + 25*sin(th0 + th1))*((3*sin(th0 + th1 + th2))/106 + sin(th0 + th1 + th2 + th3)/106 + (5*sin(th0 + th1))/106 + (3*sin(th0))/106) + 813/20, (5*cos(th1 + th2 + th3))/2 + (15*cos(th1 + th2))/2 + 5*cos(th2 + th3) + 15*cos(th2) + 10*cos(th3) - (15*cos(th0 + th1 + th2) + 5*cos(th0 + th1 + th2 + th3))*((3*cos(th0 + th1 + th2))/106 + cos(th0 + th1 + th2 + th3)/106 + (5*cos(th0 + th1))/106 + (3*cos(th0))/106) - (15*sin(th0 + th1 + th2) + 5*sin(th0 + th1 + th2 + th3))*((3*sin(th0 + th1 + th2))/106 + sin(th0 + th1 + th2 + th3)/106 + (5*sin(th0 + th1))/106 + (3*sin(th0))/106) + 171/10, (5*cos(th1 + th2 + th3))/2 + 5*cos(th2 + th3) + 5*cos(th3) - 5*cos(th0 + th1 + th2 + th3)*((3*cos(th0 + th1 + th2))/106 + cos(th0 + th1 + th2 + th3)/106 + (5*cos(th0 + th1))/106 + (3*cos(th0))/106) - 5*sin(th0 + th1 + th2 + th3)*((3*sin(th0 + th1 + th2))/106 + sin(th0 + th1 + th2 + th3)/106 + (5*sin(th0 + th1))/106 + (3*sin(th0))/106) + 71/20];

dphi=(eye(3,3)-(pinv(HbmT)*HbmT))*[dth1_d;dth2_d;dth3_d]

dy(13)=dphi(1);
dy(14)=dphi(2);
dy(15)=dphi(3);

dphi1=dy(13);
dphi2=dy(14);
dphi3=dy(15);

tau1=-kp*(th1-phi1)-kd*(dth1-dphi1);  
tau2=-kp*(th2-phi2)-kd*(dth2-dphi2);
tau3=-kp*(th3-phi3)-kd*(dth3-dphi3);

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

dy(1)=dx0; dy(2)=dy0; dy(3)=dth0; dy(4)=dth1; dy(5)=dth2;dy(6)=dth3;dy(7)=ddx0; dy(8)=ddy0; dy(9)=ddth0; dy(10)=ddth1; dy(11)=ddth2;dy(12)=ddth3;
%y(13)=phi1;y(14)=phi2;y(15)=phi3;