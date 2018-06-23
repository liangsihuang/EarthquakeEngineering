function DispTimeCurve
disp1=PlotDispTimeCurve(1);
disp2=PlotDispTimeCurve(2);
disp3=PlotDispTimeCurve(3);
disp4=PlotDispTimeCurve(4);
disp5=PlotDispTimeCurve(5);
figure
s=[0.25;0.5;1;1.5;2];
disp=[max(abs(disp1)),max(abs(disp2)),max(abs(disp3)),max(abs(disp4)),max(abs(disp5))];
plot(s,disp);
xlabel('Ƶ�ʱ� \theta / \omega');
ylabel('�ڵ�2���λ��(mm)');
end
function disp=PlotDispTimeCurve(n)
% ���룺n Ϊ1��2��3��4��5
FileName=['outputData\node2disp_',mat2str(n),'.out'];
fileID=fopen(FileName,'r');
data=textscan(fileID,'%f %f'); %��������Ϊfloat
fclose(fileID);
time=data{1};
disp=data{2};
if (length(time)-length(disp))==1
    time=time(1:end-1);
end
figure
plot(time,disp);
xlabel('ʱ��(s)');
ylabel('�ڵ�2λ��(mm)');
title('λ��ʱ������');
end