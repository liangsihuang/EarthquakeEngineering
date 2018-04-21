function [u,v,a]=CentralDifferenceMethod(ga,fre,dr,dt)
% ���룺
% �����˶����ٶ�����ga��
% ���ʵ���ϵ������Ƶ��fre�������dr������ʱ����dt
% ��������ʵ���ϵ��λ�ƣ��ٶȣ����ٶȷ�Ӧ����

p=-ga;
nc=length(ga);
u=zeros(1,nc+1);
v=zeros(1,nc);
a=zeros(1,nc);

% ��Ҫ������λ�ƺͳ��ٶ�
u(1)=0;
v(1)=0;
% �����ٶ�
cm=2*dr*fre; %c/m=2*frequency*damping_ratio
a(1)=p(1)-cm*v(1)-fre^2*u(1);
% ������Ҫu(0)
u0=u(1)-dt*v(1)+dt^2/2*a(1);
% �㷨����
k_hat=1/dt^2+cm/2/dt;
A=1/dt^2-cm/2/dt;
B=fre^2-2/dt^2;
% ��ʼ����
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