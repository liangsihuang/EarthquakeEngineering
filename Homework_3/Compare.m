clc;clear;
% SAP2000
fileID=fopen('disp_sin1.txt','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f','HeaderLines',11); %数据类型为float，分隔符为空格
fclose(fileID);
time1=data{1};
disp1=data{2};
% plot(time1,disp1);
grid on
xlabel('时间');
ylabel('位移');
title('位移时程曲线');
% Opensees
fileID=fopen('Opensees\outputData\Node2disp.out','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f'); %数据类型为float，分隔符为空格
fclose(fileID);
time2=data{1};
disp2=data{2};
if (length(time2)-length(disp2))==1
    time2=time2(1:end-1);
end
hold on
plot(time2,disp2,'r');

