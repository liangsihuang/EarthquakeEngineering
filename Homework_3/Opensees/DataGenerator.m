clc;clear;
% ���sin���𲨼��ٶȣ�����ʱ����
% sin������ֵΪ1������Ϊ1s
t=0:0.1:50;
T=1;
w=2*pi/T;
acc=sin(w*t);
plot(t,acc);
fileID=fopen('data_sin1.txt','w');
for i=1:length(acc)
    fprintf(fileID,'%f\r\n',acc(i));
end
fclose(fileID);