function [u,v,a]=NewmarkMethod(gama,beta,ga,k,m,c,dt)
% ר�ż���������ã���ⷽ�� m(ddx)+c(dx)+kx=p(p=-m*ga)
% ���룺
% �㷨����gama, beta
% gama=1/2, beta=1/4ʱ��ƽ�������ٶ�
% gama=1/2, beta=1/6ʱ�����Լ��ٶ�
% ��������ga
% ���ʵ���ϵ�ĸն�k������m������c������ʱ����dt
% ��������ʵ���ϵ��λ�ƣ��ٶȣ����ٶȷ�Ӧ����

p=-m*ga;
nc=length(p);
u=zeros(nc,1);
v=zeros(nc,1);
a=zeros(nc,1);

% ��Ҫ������λ�ƺͳ��ٶ�
u(1)=0;
v(1)=0;
% �����ٶȸ����˶�������
a(1)=(p(1)-c*v(1)-k*u(1))/m;
% parameters
k_hat=k+gama/beta/dt*c+1/beta/dt^2*m;%u(i+1)ǰϵ��
a1=1/beta/dt^2*m+gama/beta/dt*c;%u(i)ǰϵ��
a2=1/beta/dt*m+(gama/beta-1)*c;%v(i)ǰϵ��
a3=(1/2/beta-1)*m+dt*(gama/2/beta-1)*c;%a(i)ǰϵ��
% calculation for time step i
for i=2:nc
    p_hat=p(i)+a1*u(i-1)+a2*v(i-1)+a3*a(i-1);
    u(i)=p_hat/k_hat;
    v(i)=gama/beta/dt*(u(i)-u(i-1))+(1-gama/beta)*v(i-1)...
        +dt*(1-gama/2/beta)*a(i-1);
    %a(i)=1/beta/dt^2*(u(i)-u(i-1))-1/beta/dt*v(i-1)-(1/2/beta-1)*a(i-1);
    %���ٶȲ��õ��ƹ�ʽ�������˶����̷��㣬ǿ�������˶�����
    a(i)=(p(i)-c*v(i)-k*u(i))/m;
end

end