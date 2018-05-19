function [selfFrequency,mode]=InversePower(k,m)
% ���ݷ�������С������ֵ����
% ���룺
% �նȾ��� k
% �������� m
% ���:
% ����Ƶ����������selfFrequence
% ���;���mode
[n,~]=size(k);
selfFrequency=zeros(n,1);
mode=zeros(n,n);

D=k\m;
v0=ones(n,1);
v1_temp=D*v0; %��Ҫ�����м�ֵ���������������ֵ��Ƶ��^2)
[~,nmax]=max(abs(v1_temp)); % ��ȷ���������������ֵ����ֵ��λ��
v1=v1_temp/v1_temp(nmax);
w=sqrt(1/v1_temp(nmax)); % ����Ƶ�ʱ���
% v1=v1./max(abs(v1)); �㷨���󣺲��ǳ������ֵ�ľ���ֵ�����ǳ��Ծ���ֵ����ֵ
iter=0;
while (norm(v1-v0)>0.001)
    v0=v1;
    v1_temp=D*v0;
    [~,nmax]=max(abs(v1_temp)); 
    v1=v1_temp/v1_temp(nmax);
    w=sqrt(1/v1_temp(nmax));
    iter=+1;
    if(iter>100)
        disp('����ʧ��');
        break;
    end
end
selfFrequency(1)=w;
mode(:,1)=v1;

for i=2:n
    M=v1'*m*v1;
    S=eye(n)-1/M*(v1*v1')*m; %sweeping matrix
    D=D*S;
% �ظ�����
    v0=ones(n,1);
    v1_temp=D*v0;
    [~,nmax]=max(abs(v1_temp));
    v1=v1_temp/v1_temp(nmax);
    w=sqrt(1/v1_temp(nmax)); 
    iter=0;
    while (norm(v1-v0)>0.001)
        v0=v1;
        v1_temp=D*v0;
        [~,nmax]=max(abs(v1_temp)); 
        v1=v1_temp/v1_temp(nmax);
        w=sqrt(1/v1_temp(nmax));
        iter=iter+1;
        if(iter>100)
            disp('����ʧ��');
            break;
        end
    end 
    selfFrequency(i)=w;
    mode(:,i)=v1;
end

end