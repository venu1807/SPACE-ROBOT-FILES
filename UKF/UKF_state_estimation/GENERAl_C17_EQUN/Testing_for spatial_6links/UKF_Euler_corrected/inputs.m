function [n, nq, alp, a, b, bt, dx, dy, dz, al, alt, m, g,  Icxx, Icyy, Iczz, Icxy, Icyz, Iczx]=inputs()

% load('sols.mat');
% x = actual_params;
%NO. OF LINKS
n=7;
red_params = 0;

nq=1;%1 for spatial and 0 for planar
%ENTER DH PARAMETER HERE   
%  dh=[al b alp th];

alp=[0; 0; 0; 0; 0; 0; 0];
a=[0; 0.5; 1; 1; -0.5; 1; 1];
b=[0; 0; 0; 0; 0; 0; 0];
%Parent array bt and corrosponding vectors
bt=[0 1 2 3 1 5 6];

%Link Length
al=[1; 1; 1; 1; 1; 1; 1];
% %Distance from origin to link tip in term of link length
alt=[0.5; 1; 1; 1; 1; 1; 1];

%ENTER VECTOR dm
dx=[  0    al(2)/2  al(3)/2  al(4)/2  al(5)/2  al(6)/2  al(7)/2 ];
dy=[  0       0       0       0           0       0       0];
dz=[  0       0       0       0           0       0       0];

%MASS
m=[500; 10; 10; 10 ; 10; 10; 10];
% g=[0 ; 9.81; 0];
 g=[0 ; 0; 0];


%MOMENT OF INERTIA
Icxx=zeros(n,1);Icyy=zeros(n,1);Iczz=zeros(n,1); % Initialization 
Icxy=zeros(n,1);Icyz=zeros(n,1);Iczx=zeros(n,1); % Initialization 
% Icxx(1)=(1/12)*0.01*0.01;   Icyy(1)=(1/12)*m(1)*(al(1)*al(1)+0.1*0.1);  Iczz(1)=(1/12)*m(1)*al(1)*al(1);
% Icxx(2)=(1/12)*0.01*0.01;   Icyy(2)=(1/12)*m(2)*al(2)*al(2);  Iczz(2)=(1/12)*m(2)*al(2)*al(2);
% Icxx(3)=(1/12)*0.01*0.01;   Icyy(3)=(1/12)*m(3)*al(3)*al(3);  Iczz(3)=(1/12)*m(3)*al(3)*al(3);
% Icxx(4)=(1/12)*0.01*0.01;   Icyy(4)=(1/12)*m(4)*al(4)*al(4);  Iczz(4)=(1/12)*m(4)*al(4)*al(4);

% Icxx(1)=x(1);  Icyy(1)=x(1); Iczz(1)=x(1);
% Icxx(2)=x(5);   Icyy(2)=x(5);  Iczz(2)=x(5);
% Icxx(3)=x(9);   Icyy(3)=x(9);  Iczz(3)=x(9);

Icxx(1)=83.61;  Icyy(1)=83.61; Iczz(1)=83.61;
Icxx(2)=0.01;   Icyy(2)=1.05;  Iczz(2)=1.05;
Icxx(3)=0.01;   Icyy(3)=1.05;  Iczz(3)=1.05;
Icxx(4)=0.01;   Icyy(4)=1.05;  Iczz(4)=1.05;
Icxx(5)=0.01;   Icyy(5)=1.05;  Iczz(5)=1.05;
Icxx(6)=0.01;   Icyy(6)=1.05;  Iczz(6)=1.05;
Icxx(7)=0.01;   Icyy(7)=1.05;  Iczz(7)=1.05;

if red_params == 1
    M = sum(m);
    m = m / M;
    Icxx = Icxx/M;
    Icyy = Icyy/M;
    Iczz = Iczz/M;
end


% alp=[0; 0; 0];
% a=[0; 0.5; 1];
% b=[0; 0; 0];
% %Parent array bt and corrosponding vectors
% bt=[0 1 2];
% 
% %Link Length
% al=[1; 1; 1];
% % %Distance from origin to link tip in term of link length
% alt=[0.5; 1; 1];
% 
% %ENTER VECTOR dm
% % dx=[  0      x(7)  x(11)];
% dx=[  0      0.5     0.5    ];
% dy=[  0       0       0     ];
% dz=[  0       0       0     ];
% 
% 
% %MASS
% % m=[x(2); x(6); x(10)];
% m=[500 ; 10  ;  10];
% % g=[0 ; -9.81];
%  g=[0 ; 0; 0];
% 
% %MOMENT OF INERTIA
% Icxx=zeros(n,1);Icyy=zeros(n,1);Iczz=zeros(n,1); % Initialization 
% Icxy=zeros(n,1);Icyz=zeros(n,1);Iczx=zeros(n,1); % Initialization 
% % Icxx(1)=(1/12)*0.01*0.01;   Icyy(1)=(1/12)*m(1)*(al(1)*al(1)+0.1*0.1);  Iczz(1)=(1/12)*m(1)*al(1)*al(1);
% % Icxx(2)=(1/12)*0.01*0.01;   Icyy(2)=(1/12)*m(2)*al(2)*al(2);  Iczz(2)=(1/12)*m(2)*al(2)*al(2);
% % Icxx(3)=(1/12)*0.01*0.01;   Icyy(3)=(1/12)*m(3)*al(3)*al(3);  Iczz(3)=(1/12)*m(3)*al(3)*al(3);
% % Icxx(4)=(1/12)*0.01*0.01;   Icyy(4)=(1/12)*m(4)*al(4)*al(4);  Iczz(4)=(1/12)*m(4)*al(4)*al(4);
% 
% % Icxx(1)=x(1);  Icyy(1)=x(1); Iczz(1)=x(1);
% % Icxx(2)=x(5);   Icyy(2)=x(5);  Iczz(2)=x(5);
% % Icxx(3)=x(9);   Icyy(3)=x(9);  Iczz(3)=x(9);
% 
% Icxx(1)=83.61;  Icyy(1)=83.61; Iczz(1)=83.61;
% Icxx(2)=0.01;   Icyy(2)=1.05;  Iczz(2)=1.05;
% Icxx(3)=0.01;   Icyy(3)=1.05;  Iczz(3)=1.05;