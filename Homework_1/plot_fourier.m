%% Ǩ�����𲨸���Ҷ��
clc;clear;
fileID=fopen('QianAnSN.txt','r');
data=textscan(fileID,'%f','HeaderLines',9);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.01;
% �����źŵĸ���Ҷ�任
Fs=fft(ga);
N=length(ga);
% ����˫��Ƶ�� P2��Ȼ����� P2 ��ż���źų��� L ���㵥��Ƶ�� P1
P2 = abs(Fs/N); % ȡ������ֵ��������ֵҪ����������1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end���������������0��L/2���ķ�ֵ���÷���
% ����Ƶ�� f �����Ƶ����ֵƵ�� P1��
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (QianAnSN)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')
%% ELCENTRO���𲨸���Ҷ��
clc;clear;
fileID=fopen('ELCENTRO.txt','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.02;
% �����źŵĸ���Ҷ�任
Fs=fft(ga);
N=length(ga);
% ����˫��Ƶ�� P2��Ȼ����� P2 ��ż���źų��� L ���㵥��Ƶ�� P1
P2 = abs(Fs/N); % ȡ������ֵ��������ֵҪ����������1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end���������������0��L/2���ķ�ֵ���÷���
% ����Ƶ�� f �����Ƶ����ֵƵ�� P1��
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (ELCENTRO)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')
%% PEL_HOLLYWOOD���𲨸���Ҷ��
clc;clear;
fileID=fopen('PEL_HOLLYWOOD STORAGE_90.txt','r');
data=textscan(fileID,'%f','HeaderLines',5);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.02;
% �����źŵĸ���Ҷ�任
Fs=fft(ga);
N=length(ga);
% ����˫��Ƶ�� P2��Ȼ����� P2 ��ż���źų��� L ���㵥��Ƶ�� P1
P2 = abs(Fs/N); % ȡ������ֵ��������ֵҪ����������1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end���������������0��L/2���ķ�ֵ���÷���
% ����Ƶ�� f �����Ƶ����ֵƵ�� P1��
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (PEL HOLLYWOOD)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')
%% TianJing���𲨸���Ҷ��
clc;clear;
fileID=fopen('TianJingNS.txt','r');
data=textscan(fileID,'%f','HeaderLines',6);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration,1 gal= 1/100 m/s^2
dt=0.01;
% �����źŵĸ���Ҷ�任
Fs=fft(ga);
N=length(ga);
% ����˫��Ƶ�� P2��Ȼ����� P2 ��ż���źų��� L ���㵥��Ƶ�� P1
P2 = abs(Fs/N); % ȡ������ֵ��������ֵҪ����������1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end���������������0��L/2���ķ�ֵ���÷���
% ����Ƶ�� f �����Ƶ����ֵƵ�� P1��
f = (0:(N/2))/N/dt;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum (TianJingNS)')
xlabel('f (Hz)')
ylabel('|P1(f)| (m/s)')