clc;
clear;
close all;

%% Declarations
t = -5:0.1:5;

%% Functions
%Unit Step
u=t>0;

%Impulse
i=t==0;

%Ramp Signal
r = max(0, t);

%Exponential
alpha = 0.5;
e = exp(alpha * t); 

%% Plot for functions
figure

subplot(2,2,1);
plot(t,u);
ylim([-2,2]);
title("Unit Step Signal");
xlabel("x-axis");
ylabel("y-axis");

subplot(2,2,2);
plot(t,i);
ylim([-2,2]);
title("Impulse Signal");
xlabel("x-axis");
ylabel("y-axis");

subplot(2,2,3);
plot(t, r);
xlabel('t');
ylabel('r(t)');
title('Ramp Signal');

subplot(2,2,4);
plot(t, e);
xlabel('t');
ylabel('x(t)');
title('Exponential Signal');

%% Sinusoidal
ts=0:0.1:6;
As=2;
fs=1;
%Sine
s=As*sin(2*pi*fs*ts);

tc=0:0.1:6;
Ac=2;
fc=1;
%Cosine
c=Ac*cos(2*pi*fc*tc);

%% Plot for Sinusoidal
figure;
subplot(2,2,1);
plot(ts,s);
title("Sine Continuous Signal");
xlabel("x-axis");
ylabel("y-axis");
subplot(2,2,3);
stem(ts,s);
title("Sine Discrete Signal");
xlabel("x-axis");
ylabel("y-axis");


subplot(2,2,2);
plot(tc,c);
title("Cosine Continuous Signal");
xlabel("x-axis");
ylabel("y-axis");
subplot(2,2,4);
stem(tc,c);
title("Cosine Discrete Signal");
xlabel("x-axis");
ylabel("y-axis");