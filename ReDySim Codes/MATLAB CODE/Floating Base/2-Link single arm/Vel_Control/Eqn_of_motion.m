clc;
clear all;
syms m0 m1 m2 lc0 lc1 lc2 th0 th1 th2 l0 l1 l2 Izz0 Izz1 Izz2
w=m0+m1+m2;
Hbb=[w, 0
    0, w]
Hbm=[-((m1*lc0*sin(th0))+(m1*lc1*sin(th0+th1))+(m2*lc0*sin(th0))+(m2*l1*sin(th0+th1))+(m2*lc2*sin(th0+th1+th2))), -((m1*lc1*sin(th0+th1))+(m2*l1*sin(th0+th1))+(m2*lc2*sin(th0+th1+th2))), -(m2*lc2*sin(th0+th1+th2))
    ((m1*lc0*cos(th0))+(m1*lc1*cos(th0+th1))+(m2*lc0*cos(th0))+(m2*l1*cos(th0+th1))+(m2*lc2*cos(th0+th1+th2))),   ((m1*lc1*cos(th0+th1))+(m2*l1*cos(th0+th1))+(m2*lc2*cos(th0+th1+th2))),   m2*lc2*cos(th0+th1+th2)  ]
Hmm=[(((m1+m2)*(lc0^2))+(m1*(lc1^2))+(2*m1*lc0*lc1*cos(th1))+(m2*(l1^2))+(m2*(lc2^2))+(2*m2*l1*lc2*cos(th2))+(2*m2*lc0*l1*cos(th1))+(2*m2*lc0*lc2*cos(th1+th2))+Izz0+Izz1+Izz2),  ((m1*lc0*lc1*cos(th1))+(m1*(lc1^2))+(m2*(l1^2))+(m2*(lc2^2))+(2*m2*l1*lc2*cos(th2))+(m2*lc0*l1*cos(th1))+(m2*lc0*lc2*cos(th1+th2))+Izz1+Izz2),  ((m2*(lc2^2))+(m2*l1*lc2*cos(th2))+(m2*lc0*lc2*cos(th1+th2))+Izz2)
    ((m1*lc0*lc1*cos(th1))+(m1*(lc1^2))+(m2*(l1^2))+(m2*(lc2^2))+(2*m2*l1*lc2*cos(th2))+(m2*lc0*l1*cos(th1))+(m2*lc0*lc2*cos(th1+th2))+(Izz1+Izz2)),    ((m1*(lc1^2))+(m2*(l1^2))+(m2*(lc2^2))+(2*m2*l1*lc2*cos(th2))+(Izz1+Izz2)),         ((m2*(lc2^2))+(m2*l1*lc2*cos(th2))+(Izz2))
    ((m2*(lc2^2))+(m2*l1*lc2*cos(th2))+(m2*lc0*lc2*cos(th1+th2))+(Izz2)),    ((m2*(lc2^2))+(m2*l1*lc2*cos(th2))+(Izz2)),    ((m2*(lc2^2))+(Izz2))]
H=[Hbb, Hbm
    Hbm.' Hmm]
C=[0 0]