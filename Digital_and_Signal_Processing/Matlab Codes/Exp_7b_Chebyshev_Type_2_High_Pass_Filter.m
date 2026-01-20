clc;
clear;
close all;

ft=3000;
fp=300;
fs=1000;
Rs=10;
Rp=60;
Ws=fs/ft;
Wp=fp/ft;

[n,Wn]=cheb2ord(Ws,Wp,Rs,Rp);
[b,a]=cheby2(n,Rs,Wn,"high");
freqz(b,a,512,1000);
title("Chebysev type 2 filter");