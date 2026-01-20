clc;
clear;
close all;

% Time Specification;
fs = 1500;
t = 0:1/fs:1;
Am =5;
fm = 2;

% Message signal
msg = Am * sin(2 * pi * fm * t);

%Pulse Train
fo=150;
d = 0:1/fo:1;
w=0.005;
train = pulstran(t,d,"rectpuls",w);

%PAM
PAM = train.*msg;

%Plotting
subplot(4,1,1);
plot(t, msg);
title("Message Signal with frequency = 2Hz");
xlabel("Time (in sec)");
ylabel("Amplitude");

subplot(4,1,2);
plot(t,train);
title("Pulse Train");
xlabel("Time (in sec)");
ylabel("Amplitude");

subplot(4,1,3);
plot(t,PAM);
title("PAM");
xlabel("Time (in sec)");
ylabel("Amplitude");


%Design low pass filter
[b,a]=butter(5, 0.01);

%Apply low pass filter to the rectified signal
filtered_signal=filter(b, a, PAM);
subplot(4,1,4);
plot(t,filtered_signal);
xlabel("Time");
ylabel("Amplitude");
title("Demodulated Signal");