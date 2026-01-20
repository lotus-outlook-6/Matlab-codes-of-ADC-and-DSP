% Program for Circular Convolution
clc;
clear;
close all;

% Example sequences (can also be entered by user)
% x = [1 2 3 4];
% h = [2 4 6];

x = input("Enter the sequence x = ");
h = input("Enter the sequence h = ");

N1 = length(x);                 % Length of x(n)
N2 = length(h);                 % Length of h(n)

% Plot input sequence x(n)
subplot(3,1,1);
n = 0:1:N1-1;
stem(n,x);
title("x(n)");
ylabel("Amplitude --->");
xlabel("Time --->");

% Plot input sequence h(n)
subplot(3,1,2);
n = 0:1:N2-1;
stem(n,h);
title("h(n)");
ylabel("Amplitude --->");
xlabel("Time --->");

% Make both sequences equal length by zero padding
N = max(N1,N2);
if(N1 < N)
    x = [x, zeros(1,N-N1)];
end
if(N2 < N)
    h = [h, zeros(1,N-N2)];
end

% Circular convolution
for n = 1:N
    y(n) = 0;
    for i = 1:N
        j = n - i + 1;
        if j <= 0
            j = N + j;          % Circular shift
        end
        y(n) = y(n) + x(i) * h(j);
    end
end

% Display result
disp("Output y = ");
disp(y);

% Plot output sequence y(n)
subplot(3,1,3);
n = 0:1:N-1;
stem(n,y);
title("Output y(n)");
ylabel("Amplitude --->");
xlabel("Time --->");
