
clc;clear;
% ��ȡ������ٶ�����
fileID=fopen('QianAnSN.txt','r');
data=textscan(fileID,'%f','HeaderLines',9);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration ,1 gal= 1/100 m/s^2
% ��Ӧ�ײ���
dt=0.01;
Tg=0.02:0.01:10;% Tg���ܴ�0��ʼ������������Ϊʲô��
dr1=0;dr5=0.1;
% ���㷴Ӧ��
[umax1,vmax1,amax1]=Spectrum(dr1,Tg,ga,dt);
[umax5,vmax5,amax5]=Spectrum(dr5,Tg,ga,dt);
% ���ٶȷ�Ӧ��
plot(Tg,vmax1);
hold on
plot(Tg,vmax5,'k');
% �����źŵĸ���Ҷ�任
Fs=fft(ga);
N=length(ga);
% ����˫��Ƶ�� P2��Ȼ����� P2 ��ż���źų��� L ���㵥��Ƶ�� P1
P2 = abs(Fs/N); % ȡ������ֵ��������ֵҪ����������1/N
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1); % end���������������0��L/2���ķ�ֵ���÷���
% ����Ƶ�� f �����Ƶ����ֵƵ�� P1��
f = (0:(N/2))/N/dt;
T=1./f;
plot(T,P1,'r') 

xlabel('����T��s��');
ylabel('�ٶ����븵��Ҷ�ף�m/s��');
title('����ٶȷ�Ӧ��');
legend('�ٶ���','�����0.1','����Ҷ��');
% legend('�ٶ���','����Ҷ��');