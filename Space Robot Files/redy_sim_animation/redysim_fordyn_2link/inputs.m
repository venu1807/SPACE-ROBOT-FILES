% ReDySim inputs module. The model parameters are entered in this module
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx m0 m1 m2 a0 a1 a2 d1x d2x I0z I1z I2z]=inputs()

% 3 Link Manipulator
%NO. OF LINKS
n=3;

nq=0;%1 for spatial and 0 for planar
%ENTER DH PARAMETER HERE   
%  dh=[al b alp th];
alp=[0; 0; 0; 0];
a=[0; 0.5; 1; 1];
b=[0; 0; 0; 0];
%Parent array bt and corrosponding vectors
bt=[0 1 2 3];

%Link Length
al=[1; 1; 1; 1];
% %Distance from origin to link tip in term of link length
alt=[0.5; 1; 1; 1];

%ENTER VECTOR dm
dx=[  0    al(2)/2  al(3)/2  al(4)/2 ];
dy=[  0       0       0       0  ];
dz=[  0       0       0       0  ];


%MASS
m=[500; 10; 10; 10];
% g=[0 ; -9.81; 0];
 g=[0 ; 0; 0];

%MOMENT OF INERTIA
Icxx=zeros(n,1);Icyy=zeros(n,1);Iczz=zeros(n,1); % Initialization 
Icxy=zeros(n,1);Icyz=zeros(n,1);Iczx=zeros(n,1); % Initialization 
% Icxx(1)=(1/12)*0.01*0.01;   Icyy(1)=(1/12)*m(1)*(al(1)*al(1)+0.1*0.1);  Iczz(1)=(1/12)*m(1)*al(1)*al(1);
% Icxx(2)=(1/12)*0.01*0.01;   Icyy(2)=(1/12)*m(2)*al(2)*al(2);  Iczz(2)=(1/12)*m(2)*al(2)*al(2);
% Icxx(3)=(1/12)*0.01*0.01;   Icyy(3)=(1/12)*m(3)*al(3)*al(3);  Iczz(3)=(1/12)*m(3)*al(3)*al(3);
% Icxx(4)=(1/12)*0.01*0.01;   Icyy(4)=(1/12)*m(4)*al(4)*al(4);  Iczz(4)=(1/12)*m(4)*al(4)*al(4);

Icxx(1)=83.61;  Icyy(1)=83.61; Iczz(1)=83.61;
Icxx(2)=0.01;   Icyy(2)=1.05;  Iczz(2)=1.05;
Icxx(3)=0.01;   Icyy(3)=1.05;  Iczz(3)=1.05;
Icxx(4)=0.01;   Icyy(4)=1.05;  Iczz(4)=1.05;


m0=500; m1=10; m2=10;
a0=1; a1=1; a2=1;

d1x=a1/2; d2x=a2/2;
d1y=0; d2y=0;

I0z=83.61; I1z=1.05; I2z=1.05;