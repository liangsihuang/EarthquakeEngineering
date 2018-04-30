%% 迁安地震加速度时程
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
xlabel('时间（s）');
ylabel('加速度a（m/s^2）');
title('地震加速度时程（QianAnSN）');
%% ELCENTRO波加速度时程
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
xlabel('时间（s）');
ylabel('加速度a（m/s^2）');
title('地震加速度时程（ELCENTRO SN）');
%% PEL_HOLLYWOOD波加速度时程
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
xlabel('时间（s）');
ylabel('加速度a（m/s^2）');
title('地震加速度时程（PEL HOLLYWOOD）');
%% TianJing波加速度时程
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
xlabel('时间（s）');
ylabel('加速度a（m/s^2）');
title('地震加速度时程（TianJingNS）');


