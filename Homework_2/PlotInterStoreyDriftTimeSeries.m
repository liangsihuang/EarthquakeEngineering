function PlotInterStoreyDriftTimeSeries(j,mode,U,dt)
[n,~]=size(U);
inter_story_drift=InterStoreyDrift(j,mode,U);
t=0:dt:dt*(n-1);
plot(t,inter_story_drift);
xlabel('ʱ�䣨s��');
ylabel('λ��u��m��');
title([num2str(j) '����λ��ʱ��']);
end