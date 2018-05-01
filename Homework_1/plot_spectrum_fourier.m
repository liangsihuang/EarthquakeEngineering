
clc;clear;
% 读取地震加速度数据
fileID=fopen('QianAnSN.txt','r');
data=textscan(fileID,'%f','HeaderLines',9);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration ,1 gal= 1/100 m/s^2
% 反应谱参数
dt=0.01;
Tg=0.02:0.01:10;% Tg不能从0开始，否则会无穷大。为什么？
dr1=0;dr5=0.1;
% 计算反应谱
[umax1,vmax1,amax1]=Spectrum(dr1,Tg,ga,dt);
[umax5,vmax5,amax5]=Spectrum(dr5,Tg,ga,dt);
% 画速度反应谱
plot(Tg,vmax1);
hold on
plot(Tg,vmax5,'k');
% 计算信号的傅里叶变换
Fs=fft(ga);
N=length(ga);
% 计算双侧频谱 P2。然后基于 P2 和偶数信号长度 L 计算单侧频谱 P1
P2 = abs(Fs/N); % 取复数幅值，复数幅值要进行修正：1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end：最大数组索引，0和L/2处的幅值不用翻倍
% 定义频域 f 并绘制单侧幅值频谱 P1。
f = (0:(N/2))/N/dt;
T=1./f;
plot(T,P1,'r') 

xlabel('周期T（s）');
ylabel('速度谱与傅里叶谱（m/s）');
title('相对速度反应谱');
legend('速度谱','阻尼比0.1','傅里叶谱');
% legend('速度谱','傅里叶谱');