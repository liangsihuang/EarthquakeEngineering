% �����ӿռ������
clc;clear;
m=[1 0 0;0 1.5 0;0 0 2];
k=600*[1 -1 0;-1 3 -2;0 -2 5];
[selfFrequence,mode]=SubspaceIteration(k,m,3);
% ��matlab�Դ�����eig�Ա�
% [V,D]=eig(A)��������ֵ�ĶԽǾ���D�;���V�������Ƕ�Ӧ��������������ʹ��A*V=V*D
[V,D]=eig(m\k);
V=ColumnNormalize(V);
D=sqrt(D);
