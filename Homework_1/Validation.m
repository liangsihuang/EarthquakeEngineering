clc;clear;
% 对比Newmark法和中心差分法的结果，验证算法有效性
% 读取数据
fileID=fopen('RSN6_IMPVALL.I_I-ELC180.AT2','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
g=9.8;
ga=data*g;% gound acceleration
% 以自振周期为1s，阻尼比为5%的单自由度体系为例
gamma=1/2;beta=1/6;
Tg=1;
fre=2*pi/Tg;
dr=0.05;% damping ratio
dt=0.01;
[u1,v1,a1]=NewmarkMethod(gamma,beta,ga,fre,dr,dt);
[u2,v2,a2]=CentralDifferenceMethod(ga,fre,dr,dt);
% 位移对比
subplot(2,2,1);
n=length(ga);
t=0:dt:dt*(n-1);
plot(t,u1);
hold on
t=0:dt:dt*n;
plot(t,u2,'r');
title('Comparison of Displacement')
xlabel('Time(s)')
ylabel('Displacement(m)')
% 速度对比
subplot(2,2,2);
n=length(ga);
t=0:dt:dt*(n-1);
plot(t,v1);
hold on
t=0:dt:dt*(n-1);
plot(t,v2,'r');
title('Comparison of Velocity')
xlabel('Time(s)')
ylabel('Velocity(m/s)')
% 加速度对比
subplot(2,2,3);
n=length(ga);
t=0:dt:dt*(n-1);
plot(t,a1);
hold on
t=0:dt:dt*(n-1);
plot(t,a2,'r');
title('Comparison of Acceleration')
xlabel('Time(s)')
ylabel('Acceleration(m/s^2)')