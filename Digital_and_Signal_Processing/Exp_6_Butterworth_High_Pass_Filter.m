clc;
clear;
close all;

%% Frequency %%
ft = 500;           % Sampling frequency (Hz)
fp = 50;            % Passband frequency (Hz)
fs = 20;            % Stopband frequency (Hz)

wp = fp/ft;         % Normalized passband frequency (w.r.t Nyquist frequency)
ws = fs/ft;         % Normalized stopband frequency (w.r.t Nyquist frequency)

rp = 3;             % Passband ripple in dB
rs = 30;            % Stopband attenuation in dB

%% Determination %%
% Determine the minimum filter order (n) and cutoff frequency (wn)
[n, wn] = buttord(wp, ws, rp, rs);
% Design a Butterworth high-pass filter
[z, p, k] = butter(n, wn, "high");
% Convert zero-pole-gain form to second-order sections (for stability)
sos = zp2sos(z, p, k);

%% Plot the frequency response of the designed filter %%
freqz(sos, 512, 1000);