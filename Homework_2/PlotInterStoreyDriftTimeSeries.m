function PlotInterStoreyDriftTimeSeries(j,mode,U,dt)
[n,~]=size(U);
inter_story_drift=InterStoreyDrift(j,mode,U);
t=0:dt:dt*(n-1);
plot(t,inter_story_drift);
xlabel('时间（s）');
ylabel('位移u（m）');
title([num2str(j) '层层间位移时程']);
end