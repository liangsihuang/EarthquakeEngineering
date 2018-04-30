% 官方案例
clc;clear;
Fs=1000; % sampling frequency
T=1/Fs;  % sampling period = 采样时间间隔
L=1500;  % length of signal = 采样点的数量
t=(0:L-1)*T; % time vector
% 构造一个信号，其中包含幅值为 0.7 的 50 Hz 正弦量和幅值为 1 的 120 Hz 正弦量
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
% 用均值为零、方差为 4 的白噪声扰乱该信号。
X = S + 2*randn(size(t));

% % 在时域中绘制噪声信号。通过查看信号 X(t) 很难确定频率分量。
% plot(1000*t(1:50),X(1:50)) %x坐标轴为毫秒
% % plot(1000*t,X)
% title('Signal Corrupted with Zero-Mean Random Noise')
% xlabel('t (milliseconds)')
% ylabel('X(t)')

%  计算信号的傅里叶变换
Y = fft(X);
% 计算双侧频谱 P2。然后基于 P2 和偶数信号长度 L 计算单侧频谱 P1
P2 = abs(Y/L); % abs 可以取复数幅值，复数幅值要进行修正：1/L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end：最大数组索引，0和L/2处的幅值不用翻倍

% % 画双侧频谱 P2，可看出根据中点对称分布，且幅值被平均分到两边
% f = Fs*(1:L)/L;
% plot(f,P2) 

% 定义频域 f 并绘制单侧幅值频谱 P1。
% 与预期相符，由于增加了噪声，幅值并不精确等于 0.7 和 1。
% 一般情况下，较长的信号会产生更好的频率近似值。
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
