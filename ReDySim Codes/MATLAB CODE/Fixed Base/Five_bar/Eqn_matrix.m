clc;
clear all;

syms m0 m1 m2 m3 m4 lc0 lc1 lc2 lc3 lc4 th1 th2 th3 th4 l0 l1 l2 l3 l4 Izz0 Izz1 Izz2 Izz3 Izz4 t
syms dth1 dth2 dth3 dth4
syms tau1 tau2 tau3 tau4

M1 = m1*lc1^2 + Izz1
 
 
C1 =(981*lc1*m1*cos(th1))/100
 

M2 =[ Izz2 + Izz3 + Izz4 + l2^2*m3 + l2^2*m4 + l3^2*m4 + lc2^2*m2 + lc3^2*m3 + lc4^2*m4 + 2*l2*lc4*m4*cos(th3 + th4) + 2*l2*l3*m4*cos(th3) + 2*l2*lc3*m3*cos(th3) + 2*l3*lc4*m4*cos(th4), m4*l3^2 + 2*m4*cos(th4)*l3*lc4 + l2*m4*cos(th3)*l3 + m3*lc3^2 + l2*m3*cos(th3)*lc3 + m4*lc4^2 + l2*m4*cos(th3 + th4)*lc4 + Izz3 + Izz4, Izz4 + lc4^2*m4 + l2*lc4*m4*cos(th3 + th4) + l3*lc4*m4*cos(th4)
                                             m4*l3^2 + 2*m4*cos(th4)*l3*lc4 + l2*m4*cos(th3)*l3 + m3*lc3^2 + l2*m3*cos(th3)*lc3 + m4*lc4^2 + l2*m4*cos(th3 + th4)*lc4 + Izz3 + Izz4,                                                                     m4*l3^2 + 2*m4*cos(th4)*l3*lc4 + m3*lc3^2 + m4*lc4^2 + Izz3 + Izz4,                            m4*lc4^2 + l3*m4*cos(th4)*lc4 + Izz4
                                                                                                                    Izz4 + lc4^2*m4 + l2*lc4*m4*cos(th3 + th4) + l3*lc4*m4*cos(th4),                                                                                                   m4*lc4^2 + l3*m4*cos(th4)*lc4 + Izz4,                                                 m4*lc4^2 + Izz4]
 
 
C2 =[  (981*l2*m3*cos(th2))/100 + (981*l2*m4*cos(th2))/100 + (981*lc2*m2*cos(th2))/100 + (981*lc4*m4*cos(th2 + th3 + th4))/100 + (981*l3*m4*cos(th2 + th3))/100 + (981*lc3*m3*cos(th2 + th3))/100 - dth3^2*l2*lc4*m4*sin(th3 + th4) - dth4^2*l2*lc4*m4*sin(th3 + th4) - dth3^2*l2*l3*m4*sin(th3) - dth3^2*l2*lc3*m3*sin(th3) - dth4^2*l3*lc4*m4*sin(th4) - 2*dth2*dth3*l2*lc4*m4*sin(th3 + th4) - 2*dth2*dth4*l2*lc4*m4*sin(th3 + th4) - 2*dth3*dth4*l2*lc4*m4*sin(th3 + th4) - 2*dth2*dth3*l2*l3*m4*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth4*l3*lc4*m4*sin(th4) - 2*dth3*dth4*l3*lc4*m4*sin(th4)
                                                                                                                                                                                                                                                                                                           (981*lc4*m4*cos(th2 + th3 + th4))/100 + (981*l3*m4*cos(th2 + th3))/100 + (981*lc3*m3*cos(th2 + th3))/100 + dth2^2*l2*lc4*m4*sin(th3 + th4) + dth2^2*l2*l3*m4*sin(th3) + dth2^2*l2*lc3*m3*sin(th3) - dth4^2*l3*lc4*m4*sin(th4) - 2*dth2*dth4*l3*lc4*m4*sin(th4) - 2*dth3*dth4*l3*lc4*m4*sin(th4)
                                                                                                                                                                                                                                                                                                                                                                                                                                                      (lc4*m4*(981*cos(th2 + th3 + th4) + 100*dth2^2*l2*sin(th3 + th4) + 100*dth2^2*l3*sin(th4) + 100*dth3^2*l3*sin(th4) + 200*dth2*dth3*l3*sin(th4)))/100]
 
 
                                                                                    
J1 =[ -l1*sin(th1)
  l1*cos(th1)]

J2 =[ - l3*sin(th2 + th3) - l2*sin(th2) - l4*sin(th2 + th3 + th4), - l3*sin(th2 + th3) - l4*sin(th2 + th3 + th4), -l4*sin(th2 + th3 + th4)
   l3*cos(th2 + th3) + l2*cos(th2) + l4*cos(th2 + th3 + th4),   l3*cos(th2 + th3) + l4*cos(th2 + th3 + th4),  l4*cos(th2 + th3 + th4)]

J(:,1)=-J1
J(:,2:4)=J2

Jdt=diff(J,th1)*dth1+diff(J,th2)*dth2+diff(J,th3)*dth3+diff(J,th4)*dth4
Jdtdq=simplify(Jdt*[dth1;dth2; dth3;dth4])
I(1,1)=M1
I(2:4,2:4)=M2
%M(4:5,1:2)=J
%M(1:2,4:5)=J.'
C=[C1;C2]