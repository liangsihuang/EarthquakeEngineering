% �Ա�ĺ���InversePower��matlab�Դ�����eig�Աȣ����ϲ��
clc;clear;
m=[1 0 0;0 1.5 0;0 0 2];
k=600*[1 -1 0;-1 3 -2;0 -2 5];
[selfFrequence,mode]=InversePower(k,m);
% [V,D]=eig(A)��������ֵ�ĶԽǾ���D�;���V�������Ƕ�Ӧ��������������ʹ��A*V=V*D
[V,D]=eig(m\k);
V=ColumnNormalize(V);
D=sqrt(D);


