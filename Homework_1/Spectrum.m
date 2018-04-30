function [umax,vmax,amax]=Spectrum(dr,Tg,ga,dt)
% 输入：
% 阻尼比dr，damping ratio
% 特征周期向量Tg
% 地震加速度向量ga
% 地震记录时间间隔dt
% 输出：最大位移向量umax，最大速度向量vmax，最大加速度向量amax

gamma=1/2;beta=1/6;
umax=zeros(length(Tg),1);
vmax=zeros(length(Tg),1);
amax=zeros(length(Tg),1);
for i=1:length(Tg);
    fre=2*pi/Tg(i);
    [u,v,a]=NewmarkMethod(gamma,beta,ga,fre,dr,dt);
    a=a+ga;%绝对加速度
    umax(i)=max(abs(u));
    vmax(i)=max(abs(v));
    amax(i)=max(abs(a));
end
end

