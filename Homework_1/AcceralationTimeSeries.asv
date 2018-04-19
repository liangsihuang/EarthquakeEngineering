clc;clear;
fileID=fopen('ELCENTRO.DAT','r');
data=textscan(fileID,'%f','HeaderLines',5,'CommentStyle',{'***', '***'});
fclose(fileID);
g=9.8;
ground_acceleration=data*g;

data=cell2mat(data);