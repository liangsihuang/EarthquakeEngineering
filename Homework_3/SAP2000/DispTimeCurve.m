clc;
clear;
% 
fileID=fopen('disp_sin0.25.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp1=data{2};
plot(time,disp1);
grid on
xlabel('ʱ��');
ylabel('λ��');
title('λ��ʱ������');
% 
figure
fileID=fopen('disp_sin0.5.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp2=data{2};
plot(time,disp2);
grid on
xlabel('ʱ��');
ylabel('λ��');
title('λ��ʱ������');
% 
figure
fileID=fopen('disp_sin1.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp3=data{2};
plot(time,disp3);
grid on
xlabel('ʱ��');
ylabel('λ��');
title('λ��ʱ������');
% 
figure
fileID=fopen('disp_sin1.5.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp4=data{2};
plot(time,disp4);
grid on
xlabel('ʱ��');
ylabel('λ��');
title('λ��ʱ������');
% 
figure
fileID=fopen('disp_sin2.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp5=data{2};
plot(time,disp5);
grid on
xlabel('ʱ��');
ylabel('λ��');
title('λ��ʱ������');
% 
figure
s=[0.25;0.5;1;1.5;2];
disp=[max(abs(disp1)),max(abs(disp2)),max(abs(disp3)),max(abs(disp4)),max(abs(disp5))];
plot(s,disp);
xlabel('Ƶ�ʱ� \theta / \omega');
ylabel('λ��');
