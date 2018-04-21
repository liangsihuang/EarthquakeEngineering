function [umax,vmax,amax]=Spectrum(dr,Tg)
% ���룺
% �����dr��damping ratio
% ������������Tg
% ��������λ������umax������ٶ�����vmax�������ٶ�����amax
% ��ȡ����
fileID=fopen('RSN6_IMPVALL.I_I-ELC180.AT2','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
g=9.8;
ga=data*g;% gound acceleration
% ��Ӧ��
dt=0.01;gamma=1/2;beta=1/6;
umax=zeros(length(Tg),1);
vmax=zeros(length(Tg),1);
amax=zeros(length(Tg),1);
for i=1:length(Tg);
    fre=2*pi/Tg(i);
    [u,v,a]=NewmarkMethod(gamma,beta,ga,fre,dr,dt);
    umax(i)=max(abs(u));
    vmax(i)=max(abs(v));
    amax(i)=max(abs(a));
end
end

