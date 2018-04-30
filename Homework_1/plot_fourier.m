%% 迁安地震波傅里叶谱
clc;clear;
fileID=fopen('QianAnSN.txt','r');
data=textscan(fileID,'%f','HeaderLines',9);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.01;
% 计算信号的傅里叶变换
Fs=fft(ga);
N=length(ga);
% 计算双侧频谱 P2。然后基于 P2 和偶数信号长度 L 计算单侧频谱 P1
P2 = abs(Fs/N); % 取复数幅值，复数幅值要进行修正：1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end：最大数组索引，0和L/2处的幅值不用翻倍
% 定义频域 f 并绘制单侧幅值频谱 P1。
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (QianAnSN)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')
%% ELCENTRO地震波傅里叶谱
clc;clear;
fileID=fopen('ELCENTRO.txt','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.02;
% 计算信号的傅里叶变换
Fs=fft(ga);
N=length(ga);
% 计算双侧频谱 P2。然后基于 P2 和偶数信号长度 L 计算单侧频谱 P1
P2 = abs(Fs/N); % 取复数幅值，复数幅值要进行修正：1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end：最大数组索引，0和L/2处的幅值不用翻倍
% 定义频域 f 并绘制单侧幅值频谱 P1。
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (ELCENTRO)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')
%% PEL_HOLLYWOOD地震波傅里叶谱
clc;clear;
fileID=fopen('PEL_HOLLYWOOD STORAGE_90.txt','r');
data=textscan(fileID,'%f','HeaderLines',5);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.02;
% 计算信号的傅里叶变换
Fs=fft(ga);
N=length(ga);
% 计算双侧频谱 P2。然后基于 P2 和偶数信号长度 L 计算单侧频谱 P1
P2 = abs(Fs/N); % 取复数幅值，复数幅值要进行修正：1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end：最大数组索引，0和L/2处的幅值不用翻倍
% 定义频域 f 并绘制单侧幅值频谱 P1。
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (PEL HOLLYWOOD)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')
%% TianJing地震波傅里叶谱
clc;clear;
fileID=fopen('TianJingNS.txt','r');
data=textscan(fileID,'%f','HeaderLines',6);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.01;
% 计算信号的傅里叶变换
Fs=fft(ga);
N=length(ga);
% 计算双侧频谱 P2。然后基于 P2 和偶数信号长度 L 计算单侧频谱 P1
P2 = abs(Fs/N); % 取复数幅值，复数幅值要进行修正：1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end：最大数组索引，0和L/2处的幅值不用翻倍
% 定义频域 f 并绘制单侧幅值频谱 P1。
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (TianJingNS)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')