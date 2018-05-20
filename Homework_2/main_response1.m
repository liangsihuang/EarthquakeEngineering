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
[frequency,mode]=SubspaceIteration(k,m,8); % 圆频率和振型
% 计算Rayleigh阻尼矩阵
[a0,a1]=RayleighDamping(0.03,0.05,frequency(1),frequency(2));
c=a0*m+a1*k;

% 从文件导入地震动
fileID=fopen('RSN6_IMPVALL.I_I-ELC180.AT2','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
ga=data*9.8;
dt=0.01;
% 分解成各振型计算，计算广义坐标矩阵U，V，A。行：时程，列：不同振型
m=length(ga);
[n,~]=size(mode);
U=zeros(m,n);
V=zeros(m,n);
A=zeros(m,n);
for i=1:n
    phi=mode(:,i); %第i阶振型
    M=phi'*m*phi;
    K=phi'*k*phi;
    C=phi'*c*phi;
    [u,v,a]=NewmarkMethod(1/2,1/4,ga,K,M,C,dt); % 为什么用1/6（线性加速度）不行？
    U(:,i)=u;
    V(:,i)=v;
    A(:,i)=a;
end
%% 画顶层位移时程
PlotStoreyDriftTimeSeries(mode,U,dt);
%% j层层间位移时程
j=8;
PlotInterStoreyDriftTimeSeries(j,mode,U,dt);
%% j层层间剪力时程
j=1;
kk=[k1 k2 k3 k4 k5 k6 k7 k8];
PlotStoreyShearTimeSeries(j,mode,U,dt,kk);
%% 各层层间位移绝对值最大值包络图
PlotDriftEnvelope(mode,U)
%% 各层层间剪力绝对值最大值包络图
kk=[k1 k2 k3 k4 k5 k6 k7 k8];
PlotShearEnvelope(mode,U,kk)
