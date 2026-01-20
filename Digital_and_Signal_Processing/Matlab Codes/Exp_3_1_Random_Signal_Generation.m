% Program to generate and plot a random signal
clc;
clear;
close all;

t=rand(1,10);
subplot(2,1,1);
plot(t); % Plot first 10 values
xlabel('t -->');
ylabel('Amplitude -->');
title('Random Signal');
disp('t = ');
disp(t); % Display all values in t1

a = 2; % Lower bound for the random signal
b = 3; % Upper bound for the random signal
t1 = a + (b - a) * rand(100,1); % Generate a random signal of 100 points using uniform distribution
subplot(2,1,2);
plot(t1); % Plot all 100 values
xlabel('t -->');
ylabel('Amplitude -->');
title('Random Signal');
disp('t1 = ');
disp(t1);