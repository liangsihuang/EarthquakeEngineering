%% 合成第一条地震波：二类场地，第一分组，多遇，烈度7
clc;clear;
wg=17.95;dg=0.72;t1=0.8;t2=7;c=0.35;
[a,t,Sx,w]=CloughPenzien(wg,dg,t1,t2,c);
plot(t,a);
xlabel('时间t（s）');
ylabel('加速度a（m/s^2）');
title('人工合成地震加速度时程1');
figure
plot(w,Sx);
xlabel('频率w（Hz）');
ylabel('功率谱密度Sx（m^2/s^3）');
title('Clough-Penzien谱功率谱1');
%% 合成第二条地震波：三类场地，第一分组，多遇，烈度7
clc;clear;
wg=13.96;dg=0.8;t1=1.2;t2=9;c=0.25;
[a,t,Sx,w]=CloughPenzien(wg,dg,t1,t2,c);
plot(t,a);
xlabel('时间t（s）');
ylabel('加速度a（m/s^2）');
title('人工合成地震加速度时程2');
figure
plot(w,Sx);
xlabel('频率w（Hz）');
ylabel('功率谱密度Sx（m^2/s^3）');
title('Clough-Penzien谱功率谱2');