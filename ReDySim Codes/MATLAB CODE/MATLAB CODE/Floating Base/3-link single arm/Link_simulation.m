clc;
clear all;

Ti=0; Tf=30;

yy0=[0;0;0; 0.3803; -0.6198; 1.2867;0;0;0;0;0;0]; 

[T,Y] = ode45(@rigid,[Ti Tf],yy0);

set(0,'DefaultLineLineWidth',1.5)

fh1=figure('Name','Motion Parameters','NumberTitle','off');
set(fh1, 'color', 'white'); % sets the color to white 

subplot(2,2,1)
plot(T,Y(:,1),'-',T,Y(:,2))
legend('x0', 'y0')
xlabel('Time')
ylabel('Base Displacement')

%figure(2)
subplot(2,2,2)
plot(T,Y(:,3),'-',T,Y(:,4),'-',T,Y(:,5),'-',T,Y(:,6),'-')
legend('th0', 'th1', 'th2','th3')
xlabel('Time')
ylabel('Joint Angle')

%figure(3)
subplot(2,2,3)
plot(T,Y(:,7),'-',T,Y(:,8))
legend('dxo','dyo')
xlabel('Time')
ylabel('Base velocity')

%figure(4)
subplot(2,2,4)
plot(T,Y(:,9),'-',T,Y(:,10),'-',T,Y(:,11),'-',T,Y(:,12),'-')
legend('dtho','dth1','dth2','dth3')
xlabel('Time')
ylabel('Joint velocity')

%Animation

m0=500;m1=10;m2=10;m3=10; l0=1;l1=1;l2=1;l3=1; lc0=.5*l0;lc1=.5*l1;lc2=.5*l2;lc3=.5*l3;  

for i=1:length(T)
    t=T(i);
x00=0; y00=0;
x01=Y(i,1); y01=Y(i,2);
x02=x01+lc0*cos(Y(i,3)); y02=y01+lc0*sin(Y(i,3));
x03=x02+lc0*cos(Y(i,3)+(pi/2)); y03=y02+lc0*sin(Y(i,3)+(pi/2));
x04=x03+l0*cos(Y(i,3)+(pi)); y04=y03+l0*sin(Y(i,3)+(pi));
x05=x04+l0*cos(Y(i,3)+(3*pi/2)); y05=y04+l0*sin(Y(i,3)+(3*pi/2));
x06=x05+l0*cos(Y(i,3)+(2*pi)); y06=y05+l0*sin(Y(i,3)+(2*pi));
x07=x02;y07=y02;
x08=x07+l1*cos(Y(i,3)+Y(i,4)); y08=y07+l1*sin(Y(i,3)+Y(i,4));
x09=x08+l2*cos(Y(i,3)+Y(i,4)+Y(i,5)); y09=y08+l1*sin(Y(i,3)+Y(i,4)+Y(i,5));
x10=x09+l3*cos(Y(i,3)+Y(i,4)+Y(i,5)+Y(i,6)); y10=y09+l1*sin(Y(i,3)+Y(i,4)+Y(i,5)+Y(i,6));

XX=[x02 x03 x04 x05 x06 x07 x08 x09 x10];
YY=[y02 y03 y04 y05 y06 y07 y08 y09 y10];

figure(5);
%fill([x02 x03 x04 x05 x06 x07],[y02 y03 y04 y05 y06 y07],'r')
plot(XX,YY,'linewidth',4);

xmin=-1*(l0+l1+l2+l3); xmax=1*(l0+l1+l2+l3); ymin=-1*(l0+l1+l2+l3); ymax=1*(l0+l1+l2+l3);
axis([xmin xmax ymin ymax])
grid on
pause(0.00005)
end