clc;
clear;
% 
fileID=fopen('ElCentro1g.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp1=data{2};
plot(time,disp1);
fileID=fopen('ElCentro1g_fiber.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp1_fiber=data{2};
hold on
plot(time,disp1_fiber,'r');
grid on
xlabel('ʱ��(s)');
ylabel('λ��(mm)');
title('λ��ʱ������(ElCentro-1g)');
legend('���Խ�ģ��','��ά��ģ��');
axis([0,30,-500,500]);
% 
figure
fileID=fopen('ElCentro2g.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp2=data{2};
plot(time,disp2);
fileID=fopen('ElCentro2g_fiber.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp2_fiber=data{2};
hold on
plot(time,disp2_fiber,'r');
grid on
xlabel('ʱ��(s)');
ylabel('λ��(mm)');
title('λ��ʱ������(ElCentro-2g)');
legend('���Խ�ģ��','��ά��ģ��');
axis([0,30,-500,500]);
% 
figure
fileID=fopen('ElCentro3g.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp3=data{2};
plot(time,disp3);
fileID=fopen('ElCentro3g_fiber.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp3_fiber=data{2};
hold on
plot(time,disp3_fiber,'r');
grid on
xlabel('ʱ��(s)');
ylabel('λ��(mm)');
title('λ��ʱ������(ElCentro-3g)');
legend('���Խ�ģ��','��ά��ģ��');
axis([0,30,-500,500]);
% 
figure
fileID=fopen('ElCentro4g.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp4=data{2};
plot(time,disp4);
fileID=fopen('ElCentro4g_fiber.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time=data{1};
disp4_fiber=data{2};
hold on
plot(time,disp4_fiber,'r');
grid on
xlabel('ʱ��(s)');
ylabel('λ��(mm)');
title('λ��ʱ������(ElCentro-4g)');
legend('���Խ�ģ��','��ά��ģ��');
axis([0,30,-500,500]);