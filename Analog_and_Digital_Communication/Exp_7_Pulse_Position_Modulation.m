clc;
clear;
close all;

% Time Specification;
fs = 1500;
t = 0:1/fs:1;
Am = 1;
fm = 1;
fc = 10;
Ac = 1;

% Message signal
msg = Am * sin(2 * pi * fm * t);
subplot(4,1,1);
plot(t, msg);
title("Message Signal with frequency = 1KHz");
xlabel("Time (in sec)"); ylabel("Amplitude");

%Carrier Signal
crr = Ac * square(2 * pi * fc * t);
subplot(4,1,2);
plot(t, crr);
title("Carrier Signal with frequency = 10Hz");
xlabel("Time (in sec)"); ylabel("Amplitude");

%Pulse Position Modulation
ppm = zeros(size(t)); %matrix creation
for i = 1:length(t)
    if(msg(i)>0)
        ppm(i) = crr(i);
    elseif(msg(i)<0)
        ppm(i) = -crr(i);
    end
end
subplot(4,1,3);
plot(t,ppm);
title("Pulse Position Modulation");
xlabel("Time (in sec)"); ylabel("Amplitude");

%% **Demodulation**
%low pass filter;
cut_off_frequency=0.509;
order=4;
nyquist_freq=fs/2;
normalized_cut_off_freq=cut_off_frequency/nyquist_freq;
[b,a]=butter(order,normalized_cut_off_freq);
%Apply low pass filter to the rectified signal
filtered_signal=filter(b,a,ppm);
subplot(4,1,4);
plot(t,filtered_signal);
title("Demodulated signal");
xlabel("Time"); ylabel("Amplitude");