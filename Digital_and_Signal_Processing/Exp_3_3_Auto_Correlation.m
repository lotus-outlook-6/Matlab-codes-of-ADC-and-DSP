% Program to compute autocorrelation of a sequence
clc;
clear;
close all;

x = input('Enter the sequence: ');
y = xcorr(x, x);         % autocorrelation

% Plotting the original and autocorrelated signals
subplot(2,1,1);
stem(x);                        % Plot the original sequence
ylabel('Amplitude -->');
xlabel('(n) n -->');
title('Original Signal');

subplot(2,1,2);
stem(y);                        % Plot the autocorrelated output
ylabel('Amplitude -->');
xlabel('(k) n -->');
title('Auto correlated sequence');

disp('The resultant signal is y= ');
disp(y);                        % Display the result