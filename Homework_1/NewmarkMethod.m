function [u,v,a]=NewmarkMethod(gamma,beta,ga,fre,dr,dt)
% 输入：算法参数gama, beta. 
% gama=1/2, beta=1/4时是平均常加速度
% gama=1/2, beta=1/6时是线性加速度
% ，地面运动加速度向量ga，
% 单质点体系的自振频率fre，阻尼比dr，计算时间间距dt
% 输出：单质点体系的位移，速度，加速度反应向量

p=-ga;
nc=length(p);
u=zeros(1,nc);
v=zeros(1,nc);
a=zeros(1,nc);

% 需要给定初位移和初速度
u(1)=0;
v(1)=0;
% 初加速度根据运动方程算
cm=2*dr*fre;
a(1)=p(1)-cm*v(1)-fre^2*u(1);
% 算法参数计算
k_hat=fre^2+gamma/beta/dt*cm+1/beta/dt^2;%u(i)前系数
a1=1/beta/dt^2+gamma/beta/dt*cm;%u(i-1)前系数
a2=1/beta/dt+(gamma/beta-1)*cm;%v(i-1)前系数
a3=(1/2/beta-1)+dt*(gamma/2/beta-1)*cm;%a(i-1)前系数
% calculation for time step i
for i=2:nc
    p_hat=p(i)+a1*u(i-1)+a2*v(i-1)+a3*a(i-1);
    u(i)=p_hat/k_hat;
    v(i)=gamma/beta/dt*(u(i)-u(i-1))+(1-gamma/beta)*v(i-1)...
        +dt*(1-gamma/2/beta)*a(i-1);
    a(i)=p(i)-cm*v(i)-fre^2*u(i);
end

end