% Program for Linear Convolution
clc;
clear;
close all;

% Example sequences (can also be entered by user)
%x = [1 1 1 1];      
%h = [4 5 6 7];       

x = input("Enter the value x = ");
h = input("Enter the value h = ");

% Plotting input sequence x(n)
subplot(3,1,1);
stem(x);
title("Input x(n)");
ylabel("x(n) --->");
xlabel("t --->");

% Plotting input sequence h(n)
subplot(3,1,2);
stem(h);
title("Input h(n)");
ylabel("h(n) --->");
xlabel("t --->");

% Preparing for convolution
h1 = fliplr(h);                  % Flip h(n)
n1 = length(x);
n2 = length(h);
n  = n1 + n2 - 1;                % Length of output

x  = [zeros(1,n2-1), x];         % Zero padding x(n)
h1 = [h1, zeros(1,n1-1)];        % Zero padding h(n)

% Convolution process
for i = 1:n
    new = [zeros(1,i-1), h1(1:(n-i+1))]; 
    out(i) = x * new';           % Multiply and sum
end

% Display output
disp("Output = ");
disp(out);

% Plotting output sequence y(n)
subplot(3,1,3);
t = 0:1:n-1;
stem(t,out);
title("Output y(n)");
ylabel("y(n) --->");
xlabel("t --->");
