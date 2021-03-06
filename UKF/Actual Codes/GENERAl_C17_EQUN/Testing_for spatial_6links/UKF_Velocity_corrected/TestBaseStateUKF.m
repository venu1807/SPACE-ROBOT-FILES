function []=TestBaseStateUKF(i)

b=load('timevar.dat');

Nsamples = length(b);

BaseStateSaved = zeros(Nsamples, 6);

zsaved=zeros(Nsamples,6);

dt = 0.1;

u=load('statevar.dat');

mt=load('mtvar.dat');

for k=1:Nsamples
  
%    z=[u(k,13);u(k,14);u(k,15);u(k,16);u(k,17);u(k,18)]+0.0001.*randn(6,1);
  
  z=[u(k,7+i);u(k,8+i);u(k,9+i);u(k,10+i);u(k,11+i);u(k,12+i)]+0.0001.*randn(6,1);
  
  r0=[u(k,1);u(k,2);u(k,3)];
  
  Mt=[mt(k,1);mt(k,2);mt(k,3)];
  
  [d_x0, d_y0,  d_z0,  w_x , w_y,  w_z] = BaseStateUKF(z,dt,r0,Mt);
  
  BaseStateSaved(k, :) = [d_x0  d_y0  d_z0  w_x  w_y   w_z ];
  
  zsaved(k,:)=z';
  
end 

t = 0:dt:Nsamples*dt-dt;

close all;

figure; 

set(gcf,'Color','White');
 
subplot(3,2,1); hold on; box on;
plot(t, BaseStateSaved(:,1), 'b-', 'LineWidth', 2);
plot(t, zsaved(:,1), 'g-.', 'LineWidth', 2)
set(gca,'FontSize',12);
xlabel('Time (Seconds)');ylabel('xdot(m/sec)');
legend('True', 'measured');
% 
% 
subplot(3,2,2); hold on; box on;
plot(t, BaseStateSaved(:,2), 'b-', 'LineWidth', 2);
plot(t, zsaved(:,2), 'g-.', 'LineWidth', 2)
set(gca,'FontSize',12);
xlabel('Time (Seconds)');ylabel('ydot(m/sec)');
legend('True', 'measured');
 
subplot(3,2,3); hold on; box on;
plot(t, BaseStateSaved(:,3), 'b-', 'LineWidth', 2);
plot(t, zsaved(:,3), 'g-.', 'LineWidth', 2)
set(gca,'FontSize',12);
xlabel('Time (Seconds)');ylabel('zdot(m/sec)');
legend('True', 'measured');
 

subplot(3,2,4); hold on; box on;
plot(t, BaseStateSaved(:,4), 'b-', 'LineWidth', 2);
plot(t, zsaved(:,4), 'g-.', 'LineWidth', 2)
set(gca,'FontSize',12);
xlabel('Time (Seconds)');ylabel('phidot(rad/sec)');
legend('True', 'measured');
 

subplot(3,2,5); hold on; box on;
plot(t, BaseStateSaved(:,5), 'b-', 'LineWidth', 2);
plot(t, zsaved(:,5), 'g-.', 'LineWidth', 2)
set(gca,'FontSize',12);
xlabel('Time (Seconds)');ylabel('thetadot(rad/sec)');
legend('True', 'measured');
 
subplot(3,2,6); hold on; box on;
plot(t, BaseStateSaved(:,6), 'b-', 'LineWidth', 2);
plot(t, zsaved(:,6), 'g-.', 'LineWidth', 2)
set(gca,'FontSize',12);
xlabel('Time (Seconds)');ylabel('sidot(rad/sec)');
legend('True', 'measured');
 



