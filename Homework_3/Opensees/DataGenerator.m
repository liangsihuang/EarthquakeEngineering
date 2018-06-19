clc;clear;
% ���ݼ���õ��Ľṹ���ڣ����sin���𲨼��ٶȣ�����ʱ����
% sin������ֵΪ1�����ڷֱ�Ϊ�ṹ��һ���ڵ�4��2��1��2/3��0.5��
% ���ļ������ɺ���
fid=fopen('modes\Periods.txt','r');
data=textscan(fid,'%f'); %��������Ϊfloat���ָ���Ϊ�ո�
fclose(fid);
T=data{1};
T1=T(1);
t=0:0.01:50;
w1=2*pi/(4*T1);w2=2*pi/(2*T1);w3=2*pi/(T1);w4=2*pi/(2/3*T1);w5=2*pi/(0.5*T1);
acc1=sin(w1*t);acc2=sin(w2*t);acc3=sin(w3*t);acc4=sin(w4*t);acc5=sin(w5*t);
plot(t,acc1);hold on; plot(t,acc2);plot(t,acc3);plot(t,acc4);plot(t,acc5);
% д�ļ�
fid1=fopen('data_sin4T.txt','w');
for i=1:length(acc1)
    fprintf(fid1,'%f\r\n',acc1(i));
end
fclose(fid1);
fid2=fopen('data_sin2T.txt','w');
for i=1:length(acc2)
    fprintf(fid2,'%f\r\n',acc2(i));
end
fclose(fid2);
fid3=fopen('data_sinT.txt','w');
for i=1:length(acc3)
    fprintf(fid3,'%f\r\n',acc3(i));
end
fclose(fid3);
fid4=fopen('data_sin2/3T.txt','w');
for i=1:length(acc4)
    fprintf(fid4,'%f\r\n',acc4(i));
end
fclose(fid4);
fid5=fopen('data_sin0.5T.txt','w');
for i=1:length(acc5)
    fprintf(fid5,'%f\r\n',acc5(i));
end
fclose(fid5);