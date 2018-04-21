function [u,v,a]=CentralDifferenceMethod(ga,fre,dr,dt)
% 输入：
% 地面运动加速度向量ga，
% 单质点体系的自振频率fre，阻尼比dr，计算时间间距dt
% 输出：单质点体系的位移，速度，加速度反应向量

p=-ga;
nc=length(ga);
u=zeros(1,nc+1);
v=zeros(1,nc);
a=zeros(1,nc);

% 需要给定初位移和初速度
u(1)=0;
v(1)=0;
% 初加速度
cm=2*dr*fre; %c/m=2*frequency*damping_ratio
a(1)=p(1)-cm*v(1)-fre^2*u(1);
% 启动需要u(0)
u0=u(1)-dt*v(1)+dt^2/2*a(1);
% 算法参数
k_hat=1/dt^2+cm/2/dt;
A=1/dt^2-cm/2/dt;
B=fre^2-2/dt^2;
% 初始计算
p_hat=p(1)-A*u0-B*u(1);
u(2)=p_hat/k_hat;
% calculation for time step i
for i=2:nc
    p_hat=p(i)-A*u(i-1)-B*u(i);
    u(i+1)=p_hat/k_hat;
    v(i)=(u(i+1)-u(i-1))/2/dt;
    a(i)=(u(i+1)-2*u(i)+u(i-1))/dt^2;
end

end