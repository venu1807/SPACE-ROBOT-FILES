clc;
clear all;

syms x0 y0 m0 m1 m2 m3 m4 m5 m11 m12 m13 m14 m15  t
syms lc0 lc1 lc2 lc3 lc4 lc5 lc11 lc12 lc13 lc14 lc15
syms th0 th1 th2 th3 th4 th5 th11 th12 th13 th14 th15
syms l0 l1 l2 l3 l4 l5 l11 l12 l13 l14 l15
syms Izz0 Izz1 Izz2 Izz3 Izz4 Izz5 Izz11 Izz12 Izz13 Izz14 Izz15
syms dx0 dy0 dth0 dth1 dth2 dth3 dth4 dth5 dth11 dth12 dth13 dth14 dth15
syms fx0 fy0 tau0 tau1 tau2 tau3 tau4 tau5 tau11 tau12 tau13 tau14 tau15


q=[x0;y0;th0;th1;th2;th3;th4; th5; th11; th12; th13; th14; th15];
dq=[dx0; dy0; dth0; dth1; dth2; dth3; dth4; dth5; dth11; dth12; dth13; dth14; dth15];

c0=cos(th0);
s0=sin(th0);

c01=cos(th0+th1);
s01=sin(th0+th1);
c012=cos(th0+th1+th2);
s012=sin(th0+th1+th2);
c0123=cos(th0+th1+th2+th3);
s0123=sin(th0+th1+th2+th3);
c01234=cos(th0+th1+th2+th3+th4);
s01234=sin(th0+th1+th2+th3+th4);
c012345=cos(th0+th1+th2+th3+th4+th5);
s012345=sin(th0+th1+th2+th3+th4+th5);

c011=cos(th0+th11);
s011=sin(th0+th11);
c01112=cos(th0+th11+th12);
s01112=sin(th0+th11+th12);
c0111213=cos(th0+th11+th12+th13);
s0111213=sin(th0+th11+th12+th13);
c011121314=cos(th0+th11+th12+th13+th14);
s011121314=sin(th0+th11+th12+th13+th14);
c01112131415=cos(th0+th11+th12+th13+th14+th15);
s01112131415=sin(th0+th11+th12+th13+th14+th15);



c00=[x0
     y0
     0];

c10=[x0+lc0*c0+lc1*c01
    y0+lc0*s0+lc1*s01
    0];
  
c20=[x0+lc0*c0+l1*c01+lc2*c012
    y0+lc0*s0+l1*s01+lc2*s012
    0];

c30=[x0+lc0*c0+l1*c01+l2*c012+lc3*c0123
    y0+lc0*s0+l1*s01+l2*s012+lc3*s0123
    0];
c40=[x0+lc0*c0+l1*c01+l2*c012+l3*c0123+lc4*c01234
    y0+lc0*s0+l1*s01+l2*s012+l3*s0123+lc4*s01234
    0];

c50=[x0+lc0*c0+l1*c01+l2*c012+l3*c0123+l4*c01234+lc5*c012345
    y0+lc0*s0+l1*s01+l2*s012+l3*s0123+l4*s01234+lc5*s012345
    0];


c110=[x0-lc0*c0+lc11*c011
    y0-lc0*s0+lc11*s011
    0];
  
c120=[x0-lc0*c0+l11*c011+lc12*c01112
    y0-lc0*s0+l11*s011+lc12*s01112
    0];

c130=[x0-lc0*c0+l11*c011+l12*c01112+lc13*c0111213
    y0-lc0*s0+l11*s011+l12*s01112+lc13*s0111213
    0];
c140=[x0-lc0*c0+l11*c011+l12*c01112+l13*c0111213+lc14*c011121314
    y0-lc0*s0+l11*s011+l12*s01112+l13*s0111213+lc14*s011121314
    0];
c150=[x0-lc0*c0+l11*c011+l12*c01112+l13*c0111213+l14*c011121314+lc15*c01112131415
    y0-lc0*s0+l11*s011+l12*s01112+l13*s0111213+l14*s011121314+lc15*s01112131415
    0];


w00=[0
    0
    dth0];

w10=[0
    0
    dth0+dth1];

w20=[0
    0
    dth0+dth1+dth2];

w30=[0
    0
    dth0+dth1+dth2+dth3];

w40=[0
    0
    dth0+dth1+dth2+dth3+dth4];

w50=[0
    0
    dth0+dth1+dth2+dth3+dth4+dth5];

w110=[0
    0
    dth0+dth11];

w120=[0
    0
    dth0+dth11+dth12];

w130=[0
    0
    dth0+dth11+dth12+dth13];

w140=[0
    0
    dth0+dth11+dth12+dth13+dth14];

w150=[0
    0
    dth0+dth11+dth12+dth13+dth14+dth15];


for i=1:length(q)
    
% v00=[diff(c00,x0) diff(c00,y0) diff(c00,th0) diff(c00,th1) diff(c00,th2)  diff(c00,th3)  diff(c00,th4) diff(c00,th5)  diff(c00,th6) diff(c00,th11) diff(c00,th12)  diff(c00,th13)  diff(c00,th14) diff(c00,th15)  diff(c00,th16)]*dq;
v00(:,i)=diff(c00,q(i));
% v10=[diff(c10,x0) diff(c10,y0) diff(c10,th0) diff(c10,th1) diff(c10,th2)  diff(c10,th3)  diff(c10,th4) diff(c10,th5)  diff(c10,th6) diff(c10,th11) diff(c10,th12)  diff(c10,th13)  diff(c10,th14) diff(c10,th15)  diff(c10,th16)]*dq;
v10(:,i)=diff(c10,q(i));
% v20=[diff(c20,x0) diff(c20,y0) diff(c20,th0) diff(c20,th1) diff(c20,th2)  diff(c20,th3)  diff(c20,th4) diff(c20,th5)  diff(c20,th6) diff(c20,th11) diff(c20,th12)  diff(c20,th13)  diff(c20,th14) diff(c20,th15)  diff(c20,th16)]*dq;
v20(:,i)=diff(c20,q(i));
% v30=[diff(c30,x0) diff(c30,y0) diff(c30,th0) diff(c30,th1) diff(c30,th2)  diff(c30,th3)  diff(c30,th4) diff(c30,th5)  diff(c30,th6) diff(c30,th11) diff(c30,th12)  diff(c30,th13)  diff(c30,th14) diff(c30,th15)  diff(c30,th16)]*dq;
v30(:,i)=diff(c30,q(i));
% v40=[diff(c40,x0) diff(c40,y0) diff(c40,th0) diff(c40,th1) diff(c40,th2)  diff(c40,th3)  diff(c40,th4) diff(c40,th5)  diff(c40,th6) diff(c40,th11) diff(c40,th12)  diff(c40,th13)  diff(c40,th14) diff(c40,th15)  diff(c40,th16)]*dq;
v40(:,i)=diff(c40,q(i));
%v50
v50(:,i)=diff(c50,q(i));
% 
% v110=[diff(c110,x0) diff(c110,y0) diff(c110,th0) diff(c110,th1) diff(c110,th2)  diff(c110,th3)  diff(c110,th4) diff(c110,th5)  diff(c110,th6) diff(c110,th11) diff(c110,th12)  diff(c110,th13)  diff(c110,th14) diff(c110,th15)  diff(c110,th16)]*dq;
v110(:,i)=diff(c110,q(i));
% v120=[diff(c120,x0) diff(c120,y0) diff(c120,th0) diff(c120,th1) diff(c120,th2)  diff(c120,th3)  diff(c120,th4) diff(c120,th5)  diff(c120,th6) diff(c120,th11) diff(c120,th12)  diff(c120,th13)  diff(c120,th14) diff(c120,th15)  diff(c120,th16)]*dq;
v120(:,i)=diff(c120,q(i));
% v130=[diff(c130,x0) diff(c130,y0) diff(c130,th0) diff(c130,th1) diff(c130,th2)  diff(c130,th3)  diff(c130,th4) diff(c130,th5)  diff(c130,th6) diff(c130,th11) diff(c130,th12)  diff(c130,th13)  diff(c130,th14) diff(c130,th15)  diff(c130,th16)]*dq;
v130(:,i)=diff(c130,q(i));
% v140=[diff(c140,x0) diff(c140,y0) diff(c140,th0) diff(c140,th1) diff(c140,th2)  diff(c140,th3)  diff(c140,th4) diff(c140,th5)  diff(c140,th6) diff(c140,th11) diff(c140,th12)  diff(c140,th13)  diff(c140,th14) diff(c140,th15)  diff(c140,th16)]*dq;
v140(:,i)=diff(c140,q(i));
%v150
v150(:,i)=diff(c150,q(i));

end

v00=v00*dq;
v10=v10*dq;
v20=v20*dq;
v30=v30*dq;
v40=v40*dq;
v50=v50*dq;

v110=v110*dq;
v120=v120*dq;
v130=v130*dq;
v140=v140*dq;
v150=v150*dq;


K00=((m0*v00.'*v00)+(Izz0*w00.'*w00))/2;
K10=((m1*v10.'*v10)+(Izz1*w10.'*w10))/2;
K20=((m2*v20.'*v20)+(Izz2*w20.'*w20))/2;
K30=((m3*v30.'*v30)+(Izz3*w30.'*w30))/2;
K40=((m4*v40.'*v40)+(Izz4*w40.'*w40))/2;
K50=((m5*v50.'*v50)+(Izz5*w50.'*w50))/2;


K110=((m11*v110.'*v110)+(Izz11*w110.'*w110))/2;
K120=((m12*v120.'*v120)+(Izz12*w120.'*w120))/2;
K130=((m13*v130.'*v130)+(Izz13*w130.'*w130))/2;
K140=((m14*v140.'*v140)+(Izz14*w140.'*w140))/2;
K150=((m15*v150.'*v150)+(Izz15*w150.'*w150))/2;

%K=simplify(K00+K10+K20+K30+K40+K50+K60+K110+K120+K130+K140+K150+K160);
K=simplify(K00+K10+K20+K30+K40+K50+K110+K120+K130+K140+K150);



for i=1:length(q)
%Diff K with q_dot
%K1=[diff(K,dx0); diff(K,dy0); diff(K,dth0); diff(K,dth1); diff(K,dth2); diff(K,dth3); diff(K,dth4); diff(K,dth5); diff(K,dth6)];
K1(i,:)=diff(K,dq(i));

%Diff K with q
%K4=[diff(K,x0); diff(K,y0); diff(K,th0); diff(K,th1); diff(K,th2); diff(K,th3) ; diff(K,th4); diff(K,th5); diff(K,th6)];
K4(i,:)=diff(K,q(i));
end

for i=1:length(q)
%Diff K1 with t
%K2=[diff(K1,dx0) diff(K1,dy0) diff(K1,dth0) diff(K1,dth1) diff(K1,dth2) diff(K1,dth3) diff(K1,dth4) diff(K1,dth5) diff(K1,dth6)];
K2(:,i)=diff(K1,dq(i));

%K3=[diff(K1,x0) diff(K1,y0) diff(K1,th0) diff(K1,th1) diff(K1,th2) diff(K1,th3) diff(K1,th4) diff(K1,th5) diff(K1,th6)]*dq;
K3(:,i)=diff(K1,q(i));
end

K3=K3*dq;

%Equations of motion

M=simplify(K2);

C=simplify(K3-K4);

%EOM

%Minv=inv(M)

F=[fx0; fy0; tau0; tau1; tau2; tau3; tau4; tau5; tau11; tau12; tau13; tau14; tau15]

%ddq=simplify(Minv*(F-C))