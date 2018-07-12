clc;
clear;
% 
fileID=fopen('sin0.25.txt','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f','HeaderLines',11); %数据类型为float，分隔符为空格
fclose(fileID);
time=data{1};
disp1=data{2};
plot(time,disp1);
grid on
xlabel('时间(s)');
ylabel('位移(mm)');
title('位移时程曲线(0.25倍频率)');
% 
figure
fileID=fopen('sin0.5.txt','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f','HeaderLines',11); %数据类型为float，分隔符为空格
fclose(fileID);
time=data{1};
disp2=data{2};
plot(time,disp2);
grid on
xlabel('时间(s)');
ylabel('位移(mm)');
title('位移时程曲线(0.5倍频率)');
% 
figure
fileID=fopen('sin1.txt','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f','HeaderLines',11); %数据类型为float，分隔符为空格
fclose(fileID);
time=data{1};
disp3=data{2};
plot(time,disp3);
grid on
xlabel('时间(s)');
ylabel('位移(mm)');
title('位移时程曲线(1倍频率)');
% 
figure
fileID=fopen('sin1.5.txt','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f','HeaderLines',11); %数据类型为float，分隔符为空格
fclose(fileID);
time=data{1};
disp4=data{2};
plot(time,disp4);
grid on
xlabel('时间(s)');
ylabel('位移(mm)');
title('位移时程曲线(1.5倍频率)');
% 
figure
fileID=fopen('sin2.txt','r');  %fileID是个非零的正数，读不出来为-1
data=textscan(fileID,'%f %f','HeaderLines',11); %数据类型为float，分隔符为空格
fclose(fileID);
time=data{1};
disp5=data{2};
plot(time,disp5);
grid on
xlabel('时间(s)');
ylabel('位移(mm)');
title('位移时程曲线(2倍频率)');
% 
figure
s=[0.25;0.5;1;1.5;2];
disp=[max(abs(disp1)),max(abs(disp2)),max(abs(disp3)),max(abs(disp4)),max(abs(disp5))];
plot(s,disp);
xlabel('频率比 \theta / \omega');
ylabel('最大位移值(mm)');
