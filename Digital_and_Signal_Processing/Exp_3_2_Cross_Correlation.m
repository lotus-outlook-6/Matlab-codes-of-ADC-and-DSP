% Program to compute cross-correlation of two sequences
clc;
clear;
close all;

% Input two sequences from the user
x = input('Enter the 1st sequence: ');
h = input('Enter the 2nd sequence: ');
y = xcorr(x, h);     % cross-correlation

% Plot input and result in 3 subplots
subplot(3,1,1);
stem(x);                            % Plot 1st sequence
xlabel('n -->');
ylabel('Amplitude -->');
title('Input x sequence');

subplot(3,1,2);
stem(h);                            % Plot 2nd sequence
xlabel('n -->');
ylabel('Amplitude -->');
title('Input h sequence');

subplot(3,1,3);
stem(y);                            % Plot the cross-correlated output
xlabel('(k) n -->');
ylabel('Amplitude -->');
title('Cross correlated sequence');

% Display the result
disp('The resultant signal is y= ');
disp(y);