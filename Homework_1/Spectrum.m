function [umax,vmax,amax]=Spectrum(dr,Tg,ga,dt)
% ���룺
% �����dr��damping ratio
% ������������Tg
% ������ٶ�����ga
% �����¼ʱ����dt
% ��������λ������umax������ٶ�����vmax�������ٶ�����amax

gamma=1/2;beta=1/6;
umax=zeros(length(Tg),1);
vmax=zeros(length(Tg),1);
amax=zeros(length(Tg),1);
for i=1:length(Tg);
    fre=2*pi/Tg(i);
    [u,v,a]=NewmarkMethod(gamma,beta,ga,fre,dr,dt);
    a=a+ga;%���Լ��ٶ�
    umax(i)=max(abs(u));
    vmax(i)=max(abs(v));
    amax(i)=max(abs(a));
end
end

