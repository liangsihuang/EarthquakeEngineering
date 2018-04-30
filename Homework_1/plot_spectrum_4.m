% �����򣬻���Ӧ�׸�С�ڷֱ�����
clc;clear;
% ��ȡ������ٶ�����
fileID=fopen('TianJingNS.txt','r');
data=textscan(fileID,'%f','HeaderLines',6);
fclose(fileID);
data=cell2mat(data);
ga=data/100;% gound acceleration ,1 gal= 1/100 m/s^2
% ��Ӧ�ײ���
dt=0.01;
Tg=0.02:0.01:10;% Tg���ܴ�0��ʼ������������Ϊʲô��
dr1=0;dr2=0.01;dr3=0.02;dr4=0.05;dr5=0.1;
% ���㷴Ӧ��
[umax1,vmax1,amax1]=Spectrum(dr1,Tg,ga,dt);
[umax2,vmax2,amax2]=Spectrum(dr2,Tg,ga,dt);
[umax3,vmax3,amax3]=Spectrum(dr3,Tg,ga,dt);
[umax4,vmax4,amax4]=Spectrum(dr4,Tg,ga,dt);
[umax5,vmax5,amax5]=Spectrum(dr5,Tg,ga,dt);
%% �����ٶȷ�Ӧ��
plot(Tg,amax1);
hold on
plot(Tg,amax2,'r');
plot(Tg,amax3,'g');
plot(Tg,amax4,'y');
plot(Tg,amax5,'k');
xlabel('��������Tg��s��');
ylabel('���ٶ�a��m/s^2��');
title('���Լ��ٶȷ�Ӧ��');
legend('�����0','�����0.01','�����0.02','�����0.05','�����0.1');
%% ���ٶȷ�Ӧ��
plot(Tg,vmax1);
hold on
plot(Tg,vmax2,'r');
plot(Tg,vmax3,'g');
plot(Tg,vmax4,'y');
plot(Tg,vmax5,'k');
xlabel('��������Tg��s��');
ylabel('�ٶ�v��m/s��');
title('����ٶȷ�Ӧ��');
legend('�����0','�����0.01','�����0.02','�����0.05','�����0.1');
%% ��λ�Ʒ�Ӧ��
plot(Tg,umax1);
hold on
plot(Tg,umax2,'r');
plot(Tg,umax3,'g');
plot(Tg,umax4,'y');
plot(Tg,umax5,'k');
xlabel('��������Tg��s��');
ylabel('λ��u��m��');
title('���λ�Ʒ�Ӧ��');
legend('�����0','�����0.01','�����0.02','�����0.05','�����0.1');