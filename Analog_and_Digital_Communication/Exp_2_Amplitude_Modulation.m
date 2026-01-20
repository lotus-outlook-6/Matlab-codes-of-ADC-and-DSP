clc;
clear;
close all;

% Time specifications
fs = 8000;
t = (0:0.1*fs)/fs;

% Message signal
Am = 1; 
Fm = 50; 
msg = Am * sin(2 * pi * Fm * t);

% Carrier signal
Ac = 2; 
Fc = 250;
car = Ac * sin(2 * pi * Fc * t); 

% Modulated Signal (AM)
mod = (1 + (msg / Am)) .* car;

% Under Modulation (mu < 1)
mu = 0.5; % Modulation index < 1
umod = (1 + mu * (msg / Am)) .* car;

% Exact Modulation (mu = 1)
mu = 1.0; % Modulation index = 1
emod = (1 + mu * (msg / Am)) .* car;

% Over Modulation (mu > 1)
mu = 1.5; % Modulation index > 1
omod = (1 + mu * (msg / Am)) .* car;

%% Plotting

subplot(3,2,1);
plot(t, msg);
title('Message Signal');
xlabel('Time (sec)'); ylabel('Amplitude');

subplot(3,2,2);
plot(t, car);
title('Carrier Signal');
xlabel('Time (sec)'); ylabel('Amplitude');

subplot(3,2,3);
plot(t, mod);
title('Modulated Signal');
xlabel('Time (sec)'); ylabel('Amplitude');

subplot(3,2,4);
plot(t, umod);
title('Under Modulation (\mu < 1)');
xlabel('Time (sec)'); ylabel('Amplitude');

subplot(3,2,5);
plot(t, emod);
title('Exact Modulation (\mu = 1)');
xlabel('Time (sec)'); ylabel('Amplitude');

subplot(3,2,6);
plot(t, omod);
title('Over Modulation (\mu > 1)');
xlabel('Time (sec)'); ylabel('Amplitude');
