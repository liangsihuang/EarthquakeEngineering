% �ϳɵ�һ�����𲨣����ೡ�أ���һ���飬�������Ҷ�7
clc;clear;
wg=17.95;dg=0.72;t1=0.8;t2=7;c=0.35;
[a,t,Sx,w]=CloughPenzien(wg,dg,t1,t2,c);
plot(t,a);
xlabel('ʱ��t��s��');
ylabel('���ٶ�a��m/s^2��');
title('�˹��ϳɵ�����ٶ�ʱ��1');
figure
plot(w,Sx);
xlabel('Ƶ��w��Hz��');
ylabel('�������ܶ�Sx��m^2/s^3��');
title('Clough-Penzien�׹�����1');
% �ϳɵڶ������𲨣����ೡ�أ���һ���飬�������Ҷ�7