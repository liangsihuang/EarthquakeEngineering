function PlotStoreyDriftTimeSeries(mode,U,dt)
[n,~]=size(U);
t=0:dt:dt*(n-1);
storey_drift=StoreyDrift(8,mode,U);
plot(t,storey_drift);
xlabel('ʱ�䣨s��');
ylabel('λ��u��m��');
title('����λ��ʱ��');
end