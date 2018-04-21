function [u,v,a]=NewmarkMethod(gamma,beta,ga,fre,dr,dt)
% ���룺�㷨����gama, beta. 
% gama=1/2, beta=1/4ʱ��ƽ�������ٶ�
% gama=1/2, beta=1/6ʱ�����Լ��ٶ�
% �������˶����ٶ�����ga��
% ���ʵ���ϵ������Ƶ��fre�������dr������ʱ����dt
% ��������ʵ���ϵ��λ�ƣ��ٶȣ����ٶȷ�Ӧ����

p=-ga;
nc=length(p);
u=zeros(1,nc);
v=zeros(1,nc);
a=zeros(1,nc);

% ��Ҫ������λ�ƺͳ��ٶ�
u(1)=0;
v(1)=0;
% �����ٶȸ����˶�������
cm=2*dr*fre;
a(1)=p(1)-cm*v(1)-fre^2*u(1);
% �㷨��������
k_hat=fre^2+gamma/beta/dt*cm+1/beta/dt^2;%u(i)ǰϵ��
a1=1/beta/dt^2+gamma/beta/dt*cm;%u(i-1)ǰϵ��
a2=1/beta/dt+(gamma/beta-1)*cm;%v(i-1)ǰϵ��
a3=(1/2/beta-1)+dt*(gamma/2/beta-1)*cm;%a(i-1)ǰϵ��
% calculation for time step i
for i=2:nc
    p_hat=p(i)+a1*u(i-1)+a2*v(i-1)+a3*a(i-1);
    u(i)=p_hat/k_hat;
    v(i)=gamma/beta/dt*(u(i)-u(i-1))+(1-gamma/beta)*v(i-1)...
        +dt*(1-gamma/2/beta)*a(i-1);
    a(i)=p(i)-cm*v(i)-fre^2*u(i);
end

end