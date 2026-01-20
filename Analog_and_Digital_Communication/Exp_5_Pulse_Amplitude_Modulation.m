clc;
clear;
close all;

fs=150;
t=0:1/fs:1;
A=5;
fm = 2;

% Message signal
msg = A * sin(2 * pi * fm * t);

%pulse_train
pulse=1;

%PAM
pam=pulse.*msg;


%Plotting
subplot(3,1,1);
plot(t, msg);
title("Message Signal with frequency = 5Hz");
xlabel("Time (in sec)");
ylabel("Amplitude");

subplot(3,1,2);
stem(pulse);
title("Pulse Train");
xlabel("Time (in sec)");
ylabel("Amplitude");

subplot(3,1,3);
stem(t,pam);
title("PAM");
xlabel("Time (in sec)");
ylabel("Amplitude");