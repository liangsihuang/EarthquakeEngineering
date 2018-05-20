function PlotStoreyShearTimeSeries(j,mode,U,dt,kk)
inter_story_drift=StoreyDrift(j,mode,U);
storey_shear=kk(j)*inter_story_drift;
[n,~]=size(U);
t=0:dt:dt*(n-1);
plot(t,storey_shear);
xlabel('ʱ�䣨s��');
ylabel('��������N��');
title([num2str(j) '�������ʱ��']);
end