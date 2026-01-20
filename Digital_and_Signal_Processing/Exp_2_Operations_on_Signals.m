clc;
clear;
close all;

t=0:0.01:1;
amp1=4;
amp2=2;
fs=5;
sin1=amp1*sin(2*pi*fs*t);
sin2=amp2*sin(2*pi*fs*t);

a=[2,4,6,8,10];
b=[1,2,3,4,5];

%% addition
% continuous
add_cont = sin1 + sin2;
figure;
subplot(3,2,1);
plot(t, sin1);
title("Continuous 1st Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,3);
plot(t, sin2);
title("Continuous 2nd Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,5);
plot(t, add_cont);
title("Continuous Addition Signal");
xlabel("Time");
ylabel("Amplitude")
% discrete
add_disc = a + b;
subplot(3,2,2);
stem(a);
title("1st Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,4);
stem(b);
title("2nd Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,6);
stem(add_disc);
title("Discrete Addition Signal");
xlabel("Time");
ylabel("Amplitude")

%% subtraction
% continuous
sub_cont = sin1 - sin2;
figure;
subplot(3,2,1);
plot(t, sin1);
title("Continuous 1st Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,3);
plot(t, sin2);
title("Continuous 2nd Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,5);
plot(t, sub_cont);
title("Continuous Subtraction Signal");
xlabel("Time");
ylabel("Amplitude")
% discrete
sub_disc = a - b;
subplot(3,2,2);
stem(a);
title("1st Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,4);
stem(b);
title("2nd Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,6);
stem(sub_disc);
title("Discrete Subtraction Signal");
xlabel("Time");
ylabel("Amplitude")

%% multiplication
% continuous
mul_cont = sin1 .* sin2;
figure;
subplot(3,2,1);
plot(t, sin1);
title("Continuous 1st Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,3);
plot(t, sin2);
title("Continuous 2nd Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,5);
plot(t, mul_cont);
title("Continuous Multiplication Signal");
xlabel("Time");
ylabel("Amplitude")
% discrete
mul_disc = a .* b;
subplot(3,2,2);
stem(a);
title("1st Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,4);
stem(b);
title("2nd Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,6);
stem(mul_disc);
title("Discrete Multiplication Signal");
xlabel("Time");
ylabel("Amplitude")

%% division
% continuous
div_cont = sin1 ./ sin2;
figure;
subplot(3,2,1);
plot(t, sin1);
title("Continuous 1st Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,3);
plot(t, sin2);
title("Continuous 2nd Sine Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,5);
plot(t, div_cont);
title("Continuous Division Signal");
xlabel("Time");
ylabel("Amplitude")

% discrete
div_disc = a ./ b;
subplot(3,2,2);
stem(a);
title("1st Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,4);
stem(b);
title("2nd Discrete Signal");
xlabel("Time");
ylabel("Amplitude")
subplot(3,2,6);
stem(div_disc);
title("Discrete Division Signal");
xlabel("Time");
ylabel("Amplitude")