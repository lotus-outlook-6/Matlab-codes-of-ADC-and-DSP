clc;
clear;
close all;

% Time Specification;
fs = 1500;
t = 0:0.0001:1;
Am=5;
Fm = 2;

% Message signal
msg = Am * sin(2 * pi * Fm * t);

%%Pulse Train
fo=15;
d = 0:1/fo:1;
w=0.005;
train = pulstran(t,d,"rectpuls",w);

%Sawtooth
saw=Am.*sawtooth(2*pi*fo*t);

%Plotting
subplot(5,1,1);
plot(t, msg);
title("Message Signal with frequency = 2Hz");
xlabel("Time (in sec)"); ylabel("Amplitude");

subplot(5,1,2);
plot(t,train);
title("Pulse Train");
xlabel("Time (in sec)"); ylabel("Amplitude");

subplot(5,1,3);
plot(t,saw);
title("Sawtooth wave");
xlabel("Time (in sec)"); ylabel("Amplitude");

%% **Modulation**
%PWM
PWM = zeros(size(t));
for i=1:length(saw)
    if (msg(i)>=saw(i))
        PWM(i)=1;
    else
        PWM(i)=0;
    end
end
subplot(5,1,4);
plot(t,PWM);
title("PWM");
xlabel("Time (in sec)"); ylabel("Amplitude");


%% **Demodulation**
%Design low pass filter
order=4;
cut_off_frequency=0.509;
nyquist_freq=fs/2;
normalized_cut_off_freq=cut_off_frequency/nyquist_freq;
[b,a]=butter(order,normalized_cut_off_freq);

%Apply low pass filter to the rectified signal
filtered_signal=filter(b,a,PWM);
subplot(5,1,5);
plot(t,filtered_signal);
title("Demodulated signal");
xlabel("Time"); ylabel("Amplitude");