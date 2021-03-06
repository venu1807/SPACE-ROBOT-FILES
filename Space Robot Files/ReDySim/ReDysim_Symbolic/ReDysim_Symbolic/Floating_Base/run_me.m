% ReDySim main module. Use this module to generate equations of motion
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi
% Contact: surilvshah@mail.com or saha@mech.iitd.ac.in
function []=run_me()
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Enter DH parameters and Inertia propoerties below
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[q dq ddq th dth ddth n nq alp a b bt dx dy dz m g  Icxx Icyy Iczz Icxy Icyz Iczx]=inputs();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generation of the symbolic expressions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('------------------------------------------------------------------');
disp('ReDySim Symbolic Module: Floating-Base Systems');
disp('-------------------------------------------------------------------')
disp('Generating Equations of Motion')
tic
[base_eq tu] = invdyn_float (q, dq, ddq, th, dth,ddth, n,alp,a,b,bt,dx,dy,dz, m,g,Icxx,Icyy,Iczz,Icxy,Icyz,Iczx);
toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Symbolic Simplifications and writing into file equation_of_motoin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('-------------------------------------------------------------------')
disp('Performing Symbolic Simplification')
tau = simplify(tu);
base=simplify(base_eq);
disp('-------------------------------------------------------------------')
disp('Writing the simplified equations into the file named equaiton_of_motion')
fid = fopen('equation_of_motion.m','w'); 
for i=1:6
    basei = char(base(i)) ;
    fprintf(fid,'0 = %s\n\n',basei);
end

for i=1:n-1
    taui = char(tau(i)) ;
    fprintf(fid,'torque_%d = ',i);
    fprintf(fid,'%s\n\n',taui);
end
fclose all;
disp('-------------------------------------------------------------------')
disp('Thank you for using ReDySim Symolic Module');
disp('Contributors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi ');
disp('------------------------------------------------------------------');