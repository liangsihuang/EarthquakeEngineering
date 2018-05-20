function PlotStoreyDriftTimeSeries(mode,U,dt)
[n,~]=size(U);
t=0:dt:dt*(n-1);
storey_drift=StoreyDrift(8,mode,U);
plot(t,storey_drift);
xlabel('时间（s）');
ylabel('位移u（m）');
title('顶层位移时程');
end