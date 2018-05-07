%clc;
%clear all;

function dy = rigid(t,y)

x0=y(1); y0=y(2); th0=y(3); th1=y(4); th2=y(5); th3=y(6);
dx0=y(7); dy0=y(8); dth0=y(9); dth1=y(10); dth2=y(11); dth3=y(12);
%INPUT DATA

Ti=20;Tf=30;

%[ddq]= accln()

m0=500;m1=10;m2=10;m3=10;m4=10;m5=10;m6=10; l0=1;l1=1;l2=1;l3=1;l4=1;l5=1;l6=1; lc0=.5*l0;lc1=.5*l1;lc2=.5*l2;lc3=1*l3;  
Izz0=83.61; Izz1=1.05; Izz2=1.05; Izz3=2*1.05;

%syms th1 th2 dth1 dth2 tau1 tau2 tau3

fx0=0; fy0=0; tau0=0;


%thin=[-0.524; -1.393; -0.035; 2.618 ;-1.393 ;-0.035];


%Velocity

%ddth1_d=0;ddth2_d=0;ddth3_d=0;ddth4_d=0;ddth5_d=0;ddth6_d=0;

kp=49; kd=14;
tau1=0;%-kp*(th1-th1_d)-kd*(dth1-dth1_d);  
tau2=0;%-kp*(th2-th2_d)-kd*(dth2-dth2_d);
tau3=0;%-kp*(th3-th3_d)-kd*(dth3-dth3_d);

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
