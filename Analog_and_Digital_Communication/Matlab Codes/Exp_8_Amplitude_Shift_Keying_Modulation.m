clc;
clear;
close all;

%% Define the input binary bit stream
bit = [0 1 0 1 0 1];
length_bit = length(bit);

% Add one extra bit at the end for uniformity
if (bit(length_bit) == 1)
    bit(length_bit+1) = 1;
else
    bit(length_bit+1) = 0;
end

%% Define carrier signal parameters
A = 5;                            % Amplitude of carrier
time = 0:0.001:1;                 % Time vector for one bit duration
fc = 20;                          % Carrier frequency
c = A*sin(2*pi*fc*time);          % Generate carrier signal
% Preallocate 'y' and 'g' for speed
y = zeros(1, length_bit * 100);
g = zeros(1, length_bit * 100);

%% ASK Modulation: Multiply carrier with bit value
for i = 1:length_bit
    for j = (i-1)*100:(i*100)
        if (bit(i) == 1)
            y(j+1) = c(j+1);      % Transmit carrier if bit is 1
        else
            y(j+1) = 0;           % Transmit zero if bit is 0
        end
    end
end

%% ASK Demodulation: Detect presence or absence of carrier
for i = 1:length_bit
    for j = (i-1)*100:(i*100)
        if (bit(i) == 1)
            g(j+1) = c(j+1)./c(j+1); % Normalize to 1 where carrier exists
        else
            g(j+1) = 0;                % No signal where carrier is absent
        end
    end
end

%% Plotting Section

% Plot the input bit stream
subplot(4, 1, 1);
stairs(bit, 'LineWidth', 2);
title("Input Bit Stream (Stairs)");
xlabel("Time (s)"); ylabel("Amplitude");

% Plot the carrier signal
subplot(4, 1, 2);
plot(time, c, 'LineWidth', 2);
title("Carrier Signal");
xlabel("Time (s)"); ylabel("Amplitude");

% Plot the ASK modulated signal
subplot(4, 1, 3);
plot(y, 'LineWidth', 2);
title("ASK Modulated Signal");
xlabel("Time (s)"); ylabel("Amplitude");

% Plot the ASK demodulated signal
subplot(4, 1, 4);
plot(g, 'LineWidth', 2);
title("ASK Demodulated Signal");
xlabel("Time (s)"); ylabel("Amplitude");