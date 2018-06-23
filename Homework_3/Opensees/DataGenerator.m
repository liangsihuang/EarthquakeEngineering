clc;clear;
% 根据计算得到的结构周期，输出sin地震波加速度，不含时间列
% sin函数幅值为1，周期分别为结构第一周期的4，2，1，2/3，0.5倍
% 读文件，生成函数
fid=fopen('modes\Periods.txt','r');
data=textscan(fid,'%f'); %数据类型为float，分隔符为空格
fclose(fid);
T=data{1};
T1=T(1);
t=0:0.01:50; % 5001组数据
w1=2*pi/(4*T1);w2=2*pi/(2*T1);w3=2*pi/(T1);w4=2*pi/(2/3*T1);w5=2*pi/(0.5*T1);
acc1=sin(w1*t);acc2=sin(w2*t);acc3=sin(w3*t);acc4=sin(w4*t);acc5=sin(w5*t);
plot(t,acc1);hold on; plot(t,acc2);plot(t,acc3);plot(t,acc4);plot(t,acc5);
% 写文件
fid=fopen('data_sin1.txt','w');
for i=1:length(acc1)
    fprintf(fid,'%f\r\n',acc1(i));
end
fclose(fid);
fid=fopen('data_sin2.txt','w');
for i=1:length(acc2)
    fprintf(fid,'%f\r\n',acc2(i));
end
fclose(fid);
fid=fopen('data_sin3.txt','w');
for i=1:length(acc3)
    fprintf(fid,'%f\r\n',acc3(i));
end
fclose(fid);
fid=fopen('data_sin4.txt','w');
for i=1:length(acc4)
    fprintf(fid,'%f\r\n',acc4(i));
end
fclose(fid);
fid=fopen('data_sin5.txt','w');
for i=1:length(acc5)
    fprintf(fid,'%f\r\n',acc5(i));
end
fclose(fid);