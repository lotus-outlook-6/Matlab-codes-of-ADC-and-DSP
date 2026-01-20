clc;
clear;
close all;

ft=500;
fp=20;
fs=50;

Wp=fp/ft;
Ws=fs/ft;
rp=3;
rs=60;
[n,Wn]=cheb2ord(Wp,Ws,rp,rs);
[b,a]=cheby2(n,rs,Wn,"low");
freqz(b,a,512,1000);
title("Chebysev type 1 filter");