%% Ǩ��������ٶ�ʱ��
clc;clear;
fileID=fopen('QianAnSN.txt','r');
data=textscan(fileID,'%f','HeaderLines',9);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
n=length(ga);
dt=0.01;
t=0:dt:dt*(n-1);
plot(t,ga);
xlabel('ʱ�䣨s��');
ylabel('���ٶ�a��m/s^2��');
title('������ٶ�ʱ�̣�QianAnSN��');
%% ELCENTRO�����ٶ�ʱ��
clc;clear;
fileID=fopen('ELCENTRO.txt','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
n=length(ga);
dt=0.02;
t=0:dt:dt*(n-1);
plot(t,ga);
xlabel('ʱ�䣨s��');
ylabel('���ٶ�a��m/s^2��');
title('������ٶ�ʱ�̣�ELCENTRO SN��');
%% PEL_HOLLYWOOD�����ٶ�ʱ��
clc;clear;
fileID=fopen('PEL_HOLLYWOOD STORAGE_90.txt','r');
data=textscan(fileID,'%f','HeaderLines',5);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
n=length(ga);
dt=0.02;
t=0:dt:dt*(n-1);
plot(t,ga);
xlabel('ʱ�䣨s��');
ylabel('���ٶ�a��m/s^2��');
title('������ٶ�ʱ�̣�PEL HOLLYWOOD��');
%% TianJing�����ٶ�ʱ��
clc;clear;
fileID=fopen('TianJingNS.txt','r');
data=textscan(fileID,'%f','HeaderLines',6);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
n=length(ga);
dt=0.01;
t=0:dt:dt*(n-1);
plot(t,ga);
xlabel('ʱ�䣨s��');
ylabel('���ٶ�a��m/s^2��');
title('������ٶ�ʱ�̣�TianJingNS��');


