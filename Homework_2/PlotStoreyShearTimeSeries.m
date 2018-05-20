function PlotStoreyShearTimeSeries(j,mode,U,dt,kk)
inter_story_drift=StoreyDrift(j,mode,U);
storey_shear=kk(j)*inter_story_drift;
[n,~]=size(U);
t=0:dt:dt*(n-1);
plot(t,storey_shear);
xlabel('时间（s）');
ylabel('层间剪力（N）');
title([num2str(j) '层层间剪力时程']);
end