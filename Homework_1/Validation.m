clc;clear;
% �Ա�Newmark�������Ĳ�ַ��Ľ������֤�㷨��Ч��
% ��ȡ����
fileID=fopen('ELCENTRO.txt','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration ,1 gal= 1/100 m/s^2
% ����������Ϊ1s�������Ϊ5%�ĵ����ɶ���ϵΪ��
gamma=1/2;beta=1/6;
Tg=1;
fre=2*pi/Tg;
dr=0.05;% damping ratio
dt=0.01;
[u1,v1,a1]=NewmarkMethod(gamma,beta,ga,fre,dr,dt);
[u2,v2,a2]=CentralDifferenceMethod(ga,fre,dr,dt);
%% λ�ƶԱ�
n=length(ga);
t=0:dt:dt*(n-1);
plot(t,u1,'*');
hold on
t=0:dt:dt*n;
plot(t,u2,'r');
title('Comparison of Displacement')
xlabel('Time(s)')
ylabel('Displacement(m)')
legend('Newmark��','���Ĳ�ַ�');
%% �ٶȶԱ�
n=length(ga);
t=0:dt:dt*(n-1);
plot(t,v1,'*');
hold on
t=0:dt:dt*(n-1);
plot(t,v2,'r');
title('Comparison of Velocity')
xlabel('Time(s)')
ylabel('Velocity(m/s)')
legend('Newmark��','���Ĳ�ַ�');
%% ���ٶȶԱ�
n=length(ga);
t=0:dt:dt*(n-1);
plot(t,a1,'*');
hold on
t=0:dt:dt*(n-1);
plot(t,a2,'r');
title('Comparison of Acceleration')
xlabel('Time(s)')
ylabel('Acceleration(m/s^2)')
legend('Newmark��','���Ĳ�ַ�');