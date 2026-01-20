clc;
clear ;
close all;

%% Declaration
fs=8000;
t=(0:0.1*fs)/fs;
Am=1;
fm=100;
Ac=1;
fc=600;
B=10;

%msg_signal
wm=2*pi*fm;
msg=Am*cos(wm*t);

%carier_signal
wc=2*pi*fc;
car=Ac*cos(wc*t);

%Frequency;
FM=Ac*cos((wc*t)+B*sin(wm*t));

%% Plotting the FM
figure;
%Message Signal
subplot(5,1,1);
plot(t, msg);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%Carrier Signal
subplot(5,1,2);
plot(t, car);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%Frequency Modulated Signal
subplot(5,1,3);
plot(t, FM);
title('Frequency Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Frequency Demodulated Signal
order = 4;
cut_off = 150;
nyquist_freq = fs / 2;
normalized_cutoff = cut_off / nyquist_freq;
% Design Butter Low-Pass Filter
[b, a] = butter(order, normalized_cutoff);
%% Demodulation
% Rectification
rec = abs(FM);  
% Apply Low-Pass Filter Signal
Fitered_Signal = filter(b, a, rec);
%% Plot Demodulated Signal
subplot(5,1,4);
plot(t, rec, 'b');
title('Rectified Exact Modulation');
xlabel('Time (sec)'); ylabel('Amplitude');
subplot(5,1,5);
plot(t, Fitered_Signal, 'b');
title('Demodulated Signal ');
xlabel('Time (sec)'); ylabel('Amplitude');
