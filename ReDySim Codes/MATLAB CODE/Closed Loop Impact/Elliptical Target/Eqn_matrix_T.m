clc;
clear all;
%function [Mt, Jt]=Eqn_matrix_T(It,rtb)
syms m0 m1 m2 m3 m4 m5 m6 m7 lc0 lc1 lc2 lc3 lc4 lc5 lc6 lc7 x0 y0 th0 th1 th2 th3 th4 th5 th6 th7 l0 l1 l2 l3 l4 l5 l6 l7 Izz0 Izz1 Izz2 Izz3 Izz4 Izz5 Izz6 Izz7 t
syms dx0 dy0 dth0 dth1 dth2 dth3 dth4 dth5 dth6 dth7
syms fx fy tau0 tau1 tau2 tau3 tau4 tau5 tau6 tau7

syms mt1 mt2 rx1 ry1 rz1 mt2 rx2 ry2 rz2 px1 py1 px2 py2 Itxx1 Ityy1 Itzz1  Itxx2 Ityy2 Itzz2

m0=500;m1=10;m2=10;m3=10;m4=10;m5=10;m6=10; l0=1;l1=1;l2=1;l3=1;l4=1;l5=1;l6=1; lc0=.5*l0;lc1=.5*l1;lc2=.5*l2;lc3=.5*l3; lc4=.5*l4;lc5=.5*l5;lc6=.5*l6;  
Izz0=83.61; Izz1=1.05; Izz2=1.05; Izz3=1.05;Izz4=1.05; Izz5=1.05; Izz6=1.05;

%mt=50; Itxx=1;Ityy=1; Itzz=1;
%Target EOM

Jt=vpa(zeros(6,6));
Mt=vpa(zeros(6,6));
It1=[Itzz1];
It2=[Itzz2];
Mt(1,1)=It1;
Mt(2,2)=It2;
Mt(3,3)=mt1;
Mt(4,4)=mt1;
Mt(5,5)=mt2;
Mt(6,6)=mt2;

rb1=[rx1;ry1]
rb2=[rx2;ry2]
pbe1=[px1;py1]
pbe2=[px2;py2]
rtb1=pbe1-rb1
rtb2=pbe2-rb2

Rtb1(2,1)=-rtb1(1)
Rtb1(1,1)=rtb1(2)


Rtb2(2,1)=-rtb2(1)
Rtb2(1,1)=rtb2(2)

Jt(2:3,1)=Rtb1
Jt(1,1)=1;
Jt(2,2)=1;
Jt(3,3)=1;
Jt(5:6,4)=Rtb2
Jt(4,4)=1;
Jt(5,5)=1;
Jt(6,6)=1;
