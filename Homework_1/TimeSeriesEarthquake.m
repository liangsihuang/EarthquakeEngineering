clc;clear;
fileID=fopen('RSN6_IMPVALL.I_I-ELC180.AT2','r');
data=textscan(fileID,'%f','HeaderLines',4);
fclose(fileID);
data=cell2mat(data);
ga=data;
% g=9.8;
% ga=data*g;% gound acceleration
n=length(ga);
dt=0.01;
t=0:dt:dt*(n-1);
plot(t,ga);