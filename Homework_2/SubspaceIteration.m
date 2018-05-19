function [selfFrequency,mode]=SubspaceIteration(k,m,p)
% ���룺
% �նȾ��� k
% �������� m
% ��Ҫ����ǰp�����ͣ��㷨���ǰq��
% ���:
% ����Ƶ����������selfFrequence
% ���;���mode
q=min(p+8,p*2);
[n,~]=size(k);
if (q>n)
    q=n; % ��֤q��ԶС��n
end
% ��ʼ���ͣ���α�Խ��ߡ�Ϊ1������Ϊ0��
mode0=zeros(n,q);
for i=1:q
    for j=1:q
        if(i==j)
            mode0(i,j)=1;
        end
    end
end

D=k\m;
mode1=D*mode0; % ��ʼ�������һ�Σ�why???
mode1=ColumnNormalize(mode1);
[k_sub,m_sub]=RayleighRitz(k,m,mode1);
[selfFrequency,mode]=InversePower(k_sub,m_sub);
mode=mode1*mode;
mode=ColumnNormalize(mode);
iter=0;
% �ظ�����
while(norm(mode-mode0)>0.001)
    mode0=mode;
    mode1=D*mode0;
    mode1=ColumnNormalize(mode1);
    [k_sub,m_sub]=RayleighRitz(k,m,mode1);
    [selfFrequency,mode]=InversePower(k_sub,m_sub);
    mode=mode1*mode;
    mode=ColumnNormalize(mode);
    iter=iter+1;
    if(iter>10)
        disp('����ʧ��');
        break;
    end
end

end

function [k_sub,m_sub,T]=RayleighRitz(k,m,T)
% ���룺
% �նȾ��� k
% �������� m
% ���Ա任����T
% ���:
% �����������ȷ������Ա任���ӿռ�
% �ӿռ�ĸնȾ���k_sub
% �ӿռ����������m_sub
% T=rand(n,p);% �㷨�ǳ����ȶ�
% T=[1,0;0,1;0,0];
k_sub=T'*k*T;
m_sub=T'*m*T;
end