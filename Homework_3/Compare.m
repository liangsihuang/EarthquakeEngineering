clc;clear;
% SAP2000
fileID=fopen('disp_sin1.txt','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f','HeaderLines',11); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time1=data{1};
disp1=data{2};
% plot(time1,disp1);
grid on
xlabel('ʱ��');
ylabel('λ��');
title('λ��ʱ������');
% Opensees
fileID=fopen('Opensees\outputData\Node2disp.out','r');  %fileID�Ǹ��������������������Ϊ-1
data=textscan(fileID,'%f %f'); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fileID);
time2=data{1};
disp2=data{2};
if (length(time2)-length(disp2))==1
    time2=time2(1:end-1);
end
hold on
plot(time2,disp2,'r');

