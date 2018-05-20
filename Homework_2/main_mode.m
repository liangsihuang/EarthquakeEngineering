clc;clear;
m1=3.4*10^5; %kg
m2=3.4*10^5;
m3=3.2*10^5;
m4=3.0*10^5;
m5=3.0*10^5;
m6=2.8*10^5;
m7=2.7*10^5;
m8=2.6*10^5;
k1=2*10^8; %N/m
k2=2*10^8;
k3=2*10^8;
k4=1.8*10^8;
k5=1.8*10^8;
k6=1.8*10^8;
k7=1.6*10^8;
k8=1.6*10^8;
temp=[m1 m2 m3 m4 m5 m6 m7 m8];
m=diag(temp);
k=[k1+k2 -k2 0 0 0 0 0 0;
    -k2 k2+k3 -k3 0 0 0 0 0;
    0 -k3 k3+k4 -k4 0 0 0 0;
    0 0 -k4 k4+k5 -k5 0 0 0;
    0 0 0 -k5 k5+k6 -k6 0 0;
    0 0 0 0 -k6 k6+k7 -k7 0;
    0 0 0 0 0 -k7 k7+k8 -k8;
    0 0 0 0 0 0 -k8 k8];
% [V,D]=eig(m\k);
% V=ColumnNormalize(V);
% D=sqrt(D);
[frequency,mode]=SubspaceIteration(k,m,8); % 圆频率和振型
T=2*pi./frequency; % 周期
f=1./T; % 频率

% PlotMode(mode,1);
% PlotMode(mode,2);
% PlotMode(mode,3);
% PlotMode(mode,4);
% PlotMode(mode,5);
% PlotMode(mode,6);
% PlotMode(mode,7);
PlotMode(mode,8);