clc;
clear all;

syms m0 m1 m2 m3 m4 m5 m6 m7 lc0 lc1 lc2 lc3 lc4 lc5 lc6 lc7 x0 y0 th0 th1 th2 th3 th4 th5 th6 th7 l0 l1 l2 l3 l4 l5 l6 l7 Izz0 Izz1 Izz2 Izz3 Izz4 Izz5 Izz6 Izz7 t
syms dx0 dy0 dth0 dth1 dth2 dth3 dth4 dth5 dth6 dth7
syms fx fy tau0 tau1 tau2 tau3 tau4 tau5 tau6 tau7

J=vpa(zeros(1:2,1:6))

M =[                                                                                                                                                                                              m0 + m1 + m2 + m3,                                                                                                                                                                                                            0,                                                                                                                                                    - (m2*(2*l1*sin(th0 + th1) + 2*lc0*sin(th0) + 2*lc2*sin(th0 + th1 + th2)))/2 - (m1*(2*lc1*sin(th0 + th1) + 2*lc0*sin(th0)))/2 - (m3*(2*lc3*sin(th0 + th1 + th2 + th3) + 2*l1*sin(th0 + th1) + 2*lc0*sin(th0) + 2*l2*sin(th0 + th1 + th2)))/2,                                                                                                                                                           - (m3*(2*lc3*sin(th0 + th1 + th2 + th3) + 2*l1*sin(th0 + th1) + 2*l2*sin(th0 + th1 + th2)))/2 - (m2*(2*l1*sin(th0 + th1) + 2*lc2*sin(th0 + th1 + th2)))/2 - lc1*m1*sin(th0 + th1),                                                                                                                           - (m3*(2*lc3*sin(th0 + th1 + th2 + th3) + 2*l2*sin(th0 + th1 + th2)))/2 - lc2*m2*sin(th0 + th1 + th2),                                                                -lc3*m3*sin(th0 + th1 + th2 + th3)
                                                                                                                                                                                                              0,                                                                                                                                                                                            m0 + m1 + m2 + m3,                                                                                                                                                      (m2*(2*l1*cos(th0 + th1) + 2*lc0*cos(th0) + 2*lc2*cos(th0 + th1 + th2)))/2 + (m1*(2*lc1*cos(th0 + th1) + 2*lc0*cos(th0)))/2 + (m3*(2*lc3*cos(th0 + th1 + th2 + th3) + 2*l1*cos(th0 + th1) + 2*lc0*cos(th0) + 2*l2*cos(th0 + th1 + th2)))/2,                                                                                                                                                             (m2*(2*l1*cos(th0 + th1) + 2*lc2*cos(th0 + th1 + th2)))/2 + (m3*(2*lc3*cos(th0 + th1 + th2 + th3) + 2*l1*cos(th0 + th1) + 2*l2*cos(th0 + th1 + th2)))/2 + lc1*m1*cos(th0 + th1),                                                                                                                             (m3*(2*lc3*cos(th0 + th1 + th2 + th3) + 2*l2*cos(th0 + th1 + th2)))/2 + lc2*m2*cos(th0 + th1 + th2),                                                                 lc3*m3*cos(th0 + th1 + th2 + th3)
 - m2*(l1*sin(th0 + th1) + lc0*sin(th0) + lc2*sin(th0 + th1 + th2)) - m1*(lc1*sin(th0 + th1) + lc0*sin(th0)) - m3*(lc3*sin(th0 + th1 + th2 + th3) + l1*sin(th0 + th1) + lc0*sin(th0) + l2*sin(th0 + th1 + th2)), m2*(l1*cos(th0 + th1) + lc0*cos(th0) + lc2*cos(th0 + th1 + th2)) + m1*(lc1*cos(th0 + th1) + lc0*cos(th0)) + m3*(lc3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + lc0*cos(th0) + l2*cos(th0 + th1 + th2)), Izz0 + Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc0^2*m1 + lc1^2*m1 + lc0^2*m2 + lc2^2*m2 + lc0^2*m3 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + 2*l2*lc0*m3*cos(th1 + th2) + 2*lc0*lc2*m2*cos(th1 + th2) + 2*l1*l2*m3*cos(th2) + 2*l1*lc0*m2*cos(th1) + 2*l1*lc2*m2*cos(th2) + 2*l1*lc0*m3*cos(th1) + 2*l2*lc3*m3*cos(th3) + 2*lc0*lc1*m1*cos(th1) + 2*lc0*lc3*m3*cos(th1 + th2 + th3), Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + 2*l1*l2*m3*cos(th2) + l1*lc0*m2*cos(th1) + 2*l1*lc2*m2*cos(th2) + l1*lc0*m3*cos(th1) + 2*l2*lc3*m3*cos(th3) + lc0*lc1*m1*cos(th1) + lc0*lc3*m3*cos(th1 + th2 + th3), Izz2 + Izz3 + l2^2*m3 + lc2^2*m2 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + l1*l2*m3*cos(th2) + l1*lc2*m2*cos(th2) + 2*l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3), Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3)
                                                - m3*(lc3*sin(th0 + th1 + th2 + th3) + l1*sin(th0 + th1) + l2*sin(th0 + th1 + th2)) - m2*(l1*sin(th0 + th1) + lc2*sin(th0 + th1 + th2)) - lc1*m1*sin(th0 + th1),                                                m2*(l1*cos(th0 + th1) + lc2*cos(th0 + th1 + th2)) + m3*(lc3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + l2*cos(th0 + th1 + th2)) + lc1*m1*cos(th0 + th1),                                                     Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + 2*l1*l2*m3*cos(th2) + l1*lc0*m2*cos(th1) + 2*l1*lc2*m2*cos(th2) + l1*lc0*m3*cos(th1) + 2*l2*lc3*m3*cos(th3) + lc0*lc1*m1*cos(th1) + lc0*lc3*m3*cos(th1 + th2 + th3),                                                                                                                                                          Izz1 + Izz2 + Izz3 + l1^2*m2 + l1^2*m3 + l2^2*m3 + lc1^2*m1 + lc2^2*m2 + lc3^2*m3 + 2*l1*lc3*m3*cos(th2 + th3) + 2*l1*l2*m3*cos(th2) + 2*l1*lc2*m2*cos(th2) + 2*l2*lc3*m3*cos(th3),                                                                                          m3*l2^2 + 2*m3*cos(th3)*l2*lc3 + l1*m3*cos(th2)*l2 + m2*lc2^2 + l1*m2*cos(th2)*lc2 + m3*lc3^2 + l1*m3*cos(th2 + th3)*lc3 + Izz2 + Izz3,                                   Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3)
                                                                                                                  - m3*(lc3*sin(th0 + th1 + th2 + th3) + l2*sin(th0 + th1 + th2)) - lc2*m2*sin(th0 + th1 + th2),                                                                                                                  m3*(lc3*cos(th0 + th1 + th2 + th3) + l2*cos(th0 + th1 + th2)) + lc2*m2*cos(th0 + th1 + th2),                                                                                                                                                                 Izz2 + Izz3 + l2^2*m3 + lc2^2*m2 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc0*m3*cos(th1 + th2) + lc0*lc2*m2*cos(th1 + th2) + l1*l2*m3*cos(th2) + l1*lc2*m2*cos(th2) + 2*l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3),                                                                                                                                                                                                      m3*l2^2 + 2*m3*cos(th3)*l2*lc3 + l1*m3*cos(th2)*l2 + m2*lc2^2 + l1*m2*cos(th2)*lc2 + m3*lc3^2 + l1*m3*cos(th2 + th3)*lc3 + Izz2 + Izz3,                                                                                                                                                              m3*l2^2 + 2*m3*cos(th3)*l2*lc3 + m2*lc2^2 + m3*lc3^2 + Izz2 + Izz3,                                                              m3*lc3^2 + l2*m3*cos(th3)*lc3 + Izz3
                                                                                                                                                                             -lc3*m3*sin(th0 + th1 + th2 + th3),                                                                                                                                                                            lc3*m3*cos(th0 + th1 + th2 + th3),                                                                                                                                                                                                                                                                                               Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3) + lc0*lc3*m3*cos(th1 + th2 + th3),                                                                                                                                                                                                                                                                             Izz3 + lc3^2*m3 + l1*lc3*m3*cos(th2 + th3) + l2*lc3*m3*cos(th3),                                                                                                                                                                                            m3*lc3^2 + l2*m3*cos(th3)*lc3 + Izz3,                                                                                   m3*lc3^2 + Izz3]
 
 
C =[                                                                                                                                                                                                                                                    - dth0^2*l2*m3*cos(th0 + th1 + th2) - dth1^2*l2*m3*cos(th0 + th1 + th2) - dth2^2*l2*m3*cos(th0 + th1 + th2) - dth0^2*lc2*m2*cos(th0 + th1 + th2) - dth1^2*lc2*m2*cos(th0 + th1 + th2) - dth2^2*lc2*m2*cos(th0 + th1 + th2) - dth0^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth1^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth2^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth3^2*lc3*m3*cos(th0 + th1 + th2 + th3) - dth0^2*l1*m2*cos(th0 + th1) - dth1^2*l1*m2*cos(th0 + th1) - dth0^2*l1*m3*cos(th0 + th1) - dth1^2*l1*m3*cos(th0 + th1) - dth0^2*lc1*m1*cos(th0 + th1) - dth1^2*lc1*m1*cos(th0 + th1) - dth0^2*lc0*m1*cos(th0) - dth0^2*lc0*m2*cos(th0) - dth0^2*lc0*m3*cos(th0) - 2*dth0*dth1*l2*m3*cos(th0 + th1 + th2) - 2*dth0*dth2*l2*m3*cos(th0 + th1 + th2) - 2*dth1*dth2*l2*m3*cos(th0 + th1 + th2) - 2*dth0*dth1*lc2*m2*cos(th0 + th1 + th2) - 2*dth0*dth2*lc2*m2*cos(th0 + th1 + th2) - 2*dth1*dth2*lc2*m2*cos(th0 + th1 + th2) - 2*dth0*dth1*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth0*dth2*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth0*dth3*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth1*dth2*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth1*dth3*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth2*dth3*lc3*m3*cos(th0 + th1 + th2 + th3) - 2*dth0*dth1*l1*m2*cos(th0 + th1) - 2*dth0*dth1*l1*m3*cos(th0 + th1) - 2*dth0*dth1*lc1*m1*cos(th0 + th1)
                                                                                                                                                                                                                                                    - dth0^2*l2*m3*sin(th0 + th1 + th2) - dth1^2*l2*m3*sin(th0 + th1 + th2) - dth2^2*l2*m3*sin(th0 + th1 + th2) - dth0^2*lc2*m2*sin(th0 + th1 + th2) - dth1^2*lc2*m2*sin(th0 + th1 + th2) - dth2^2*lc2*m2*sin(th0 + th1 + th2) - dth0^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth1^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth2^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth3^2*lc3*m3*sin(th0 + th1 + th2 + th3) - dth0^2*l1*m2*sin(th0 + th1) - dth1^2*l1*m2*sin(th0 + th1) - dth0^2*l1*m3*sin(th0 + th1) - dth1^2*l1*m3*sin(th0 + th1) - dth0^2*lc1*m1*sin(th0 + th1) - dth1^2*lc1*m1*sin(th0 + th1) - dth0^2*lc0*m1*sin(th0) - dth0^2*lc0*m2*sin(th0) - dth0^2*lc0*m3*sin(th0) - 2*dth0*dth1*l2*m3*sin(th0 + th1 + th2) - 2*dth0*dth2*l2*m3*sin(th0 + th1 + th2) - 2*dth1*dth2*l2*m3*sin(th0 + th1 + th2) - 2*dth0*dth1*lc2*m2*sin(th0 + th1 + th2) - 2*dth0*dth2*lc2*m2*sin(th0 + th1 + th2) - 2*dth1*dth2*lc2*m2*sin(th0 + th1 + th2) - 2*dth0*dth1*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth0*dth2*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth0*dth3*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth1*dth2*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth1*dth3*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth2*dth3*lc3*m3*sin(th0 + th1 + th2 + th3) - 2*dth0*dth1*l1*m2*sin(th0 + th1) - 2*dth0*dth1*l1*m3*sin(th0 + th1) - 2*dth0*dth1*lc1*m1*sin(th0 + th1)
 - dth2^2*l1*lc3*m3*sin(th2 + th3) - dth3^2*l1*lc3*m3*sin(th2 + th3) - dth1^2*l2*lc0*m3*sin(th1 + th2) - dth2^2*l2*lc0*m3*sin(th1 + th2) - dth1^2*lc0*lc2*m2*sin(th1 + th2) - dth2^2*lc0*lc2*m2*sin(th1 + th2) - dth2^2*l1*l2*m3*sin(th2) - dth1^2*l1*lc0*m2*sin(th1) - dth2^2*l1*lc2*m2*sin(th2) - dth1^2*l1*lc0*m3*sin(th1) - dth3^2*l2*lc3*m3*sin(th3) - dth1^2*lc0*lc1*m1*sin(th1) - dth1^2*lc0*lc3*m3*sin(th1 + th2 + th3) - dth2^2*lc0*lc3*m3*sin(th1 + th2 + th3) - dth3^2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth2*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth1*l2*lc0*m3*sin(th1 + th2) - 2*dth0*dth2*l2*lc0*m3*sin(th1 + th2) - 2*dth1*dth2*l2*lc0*m3*sin(th1 + th2) - 2*dth0*dth1*lc0*lc2*m2*sin(th1 + th2) - 2*dth0*dth2*lc0*lc2*m2*sin(th1 + th2) - 2*dth1*dth2*lc0*lc2*m2*sin(th1 + th2) - 2*dth0*dth2*l1*l2*m3*sin(th2) - 2*dth1*dth2*l1*l2*m3*sin(th2) - 2*dth0*dth1*l1*lc0*m2*sin(th1) - 2*dth0*dth2*l1*lc2*m2*sin(th2) - 2*dth1*dth2*l1*lc2*m2*sin(th2) - 2*dth0*dth1*l1*lc0*m3*sin(th1) - 2*dth0*dth3*l2*lc3*m3*sin(th3) - 2*dth1*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3) - 2*dth0*dth1*lc0*lc1*m1*sin(th1) - 2*dth0*dth1*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth3*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth1*dth2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth1*dth3*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth2*dth3*lc0*lc3*m3*sin(th1 + th2 + th3)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               dth0^2*l2*lc0*m3*sin(th1 + th2) - dth3^2*l1*lc3*m3*sin(th2 + th3) - dth2^2*l1*lc3*m3*sin(th2 + th3) + dth0^2*lc0*lc2*m2*sin(th1 + th2) - dth2^2*l1*l2*m3*sin(th2) + dth0^2*l1*lc0*m2*sin(th1) - dth2^2*l1*lc2*m2*sin(th2) + dth0^2*l1*lc0*m3*sin(th1) - dth3^2*l2*lc3*m3*sin(th3) + dth0^2*lc0*lc1*m1*sin(th1) + dth0^2*lc0*lc3*m3*sin(th1 + th2 + th3) - 2*dth0*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth2*l1*lc3*m3*sin(th2 + th3) - 2*dth1*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth2*dth3*l1*lc3*m3*sin(th2 + th3) - 2*dth0*dth2*l1*l2*m3*sin(th2) - 2*dth1*dth2*l1*l2*m3*sin(th2) - 2*dth0*dth2*l1*lc2*m2*sin(th2) - 2*dth1*dth2*l1*lc2*m2*sin(th2) - 2*dth0*dth3*l2*lc3*m3*sin(th3) - 2*dth1*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          dth0^2*l1*lc3*m3*sin(th2 + th3) + dth1^2*l1*lc3*m3*sin(th2 + th3) + dth0^2*l2*lc0*m3*sin(th1 + th2) + dth0^2*lc0*lc2*m2*sin(th1 + th2) + dth0^2*l1*l2*m3*sin(th2) + dth1^2*l1*l2*m3*sin(th2) + dth0^2*l1*lc2*m2*sin(th2) + dth1^2*l1*lc2*m2*sin(th2) - dth3^2*l2*lc3*m3*sin(th3) + dth0^2*lc0*lc3*m3*sin(th1 + th2 + th3) + 2*dth0*dth1*l1*lc3*m3*sin(th2 + th3) + 2*dth0*dth1*l1*l2*m3*sin(th2) + 2*dth0*dth1*l1*lc2*m2*sin(th2) - 2*dth0*dth3*l2*lc3*m3*sin(th3) - 2*dth1*dth3*l2*lc3*m3*sin(th3) - 2*dth2*dth3*l2*lc3*m3*sin(th3)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   lc3*m3*(dth0^2*l1*sin(th2 + th3) + dth1^2*l1*sin(th2 + th3) + dth0^2*l2*sin(th3) + dth1^2*l2*sin(th3) + dth2^2*l2*sin(th3) + dth0^2*lc0*sin(th1 + th2 + th3) + 2*dth0*dth1*l1*sin(th2 + th3) + 2*dth0*dth1*l2*sin(th3) + 2*dth0*dth2*l2*sin(th3) + 2*dth1*dth2*l2*sin(th3))]
 
 

 
  J1=[0 0;0 0]
  
J2=[  lc0*sin(th0)
 -lc0*cos(th0)]

J3=[ - l3*sin(th0 + th1 + th2 + th3) - l1*sin(th0 + th1) - lc0*sin(th0) - l2*sin(th0 + th1 + th2), - l3*sin(th0 + th1 + th2 + th3) - l1*sin(th0 + th1) - l2*sin(th0 + th1 + th2), - l3*sin(th0 + th1 + th2 + th3) - l2*sin(th0 + th1 + th2), -l3*sin(th0 + th1 + th2 + th3)
   l3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + lc0*cos(th0) + l2*cos(th0 + th1 + th2),   l3*cos(th0 + th1 + th2 + th3) + l1*cos(th0 + th1) + l2*cos(th0 + th1 + th2),   l3*cos(th0 + th1 + th2 + th3) + l2*cos(th0 + th1 + th2),  l3*cos(th0 + th1 + th2 + th3)]

J(1:2,1:2)=J1;
J(1:2,4:6)=J3(1:2,2:4);
J(1:2,3)=-J2(:,1)+J3(:,1);

Jdt=diff(J,x0)*dx0+diff(J,y0)*dy0+diff(J,th0)*dth0+diff(J,th1)*dth1+diff(J,th2)*dth2+diff(J,th3)*dth3
Jdtdq=simplify(Jdt*[dx0;dy0;dth0;dth1;dth2; dth3])
I=M
%M(4:5,1:2)=J
%M(1:2,4:5)=J.'
C