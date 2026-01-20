clc;
clear;
close all;

% Time Specification
fm = 3;
t = 0:0.02:2
A=4;

% Message signal
mod = A * sin(2 * pi * fm * t);
subplot(3,1,1);
plot(t, mod);
title("Message Signal with frequency = 3Hz");
xlabel("Time (in sec)");
ylabel("Amplitude");

%pulse_train
imp=1;
pam=imp.*mod;
subplot(3,1,2);
stem(imp);
title("Pulse Train");
xlabel("Time (in sec)");
ylabel("Amplitude");

%PAM
subplot(3,1,3);
stem(t,pam);
title("PAM");
xlabel("Time (in sec)");
ylabel("Amplitude");