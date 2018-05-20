function [a0,a1]=RayleighDamping(dp1,dp2,w1,w2)
% Rayleigh阻尼：c=a0*m+a1*k
% 输入：
% 第一个振型对应的阻尼比 dp1 和 频率 w1
% 第二个振型对应的阻尼比 dp2 和 频率 w2
% 实际应用的情况：一般第一个取基频，第二个取主要贡献的振型中尽可能高的频率
% 输出：
% 两个标量：a0和a1
w=[w2 -w1;-1/w2 1/w1];
dp=[dp1;dp2];
a=2*w1*w2/(w2^2-w1^2)*w*dp;
a0=a(1);
a1=a(2);
end
