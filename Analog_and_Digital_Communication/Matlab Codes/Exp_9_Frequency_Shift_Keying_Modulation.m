clc;
clear ;
close all;

x=[ones(1,20) zeros(1,20) ones(1,20) zeros(1,20) ones(1,20)];
subplot(4,1,1);
plot(x);
title("Digital Signal");
xlabel('Number of Samples');
ylabel('Amplitude');

f=1*10^6;
fs=10*10^6;
n=100;
for i=0: n-1
    d(i+1)=sin(2*pi*(f/fs)*i);
end

subplot(4,1,2);
plot(d);
title("Carrier Signal");
xlabel('Number of Samples');
ylabel('Amplitude');

for i=0:n-1
    if(x(i+1)==1)
        x(i+1)=sin(2*pi*(f/fs)*i);
    else
        x(i+1)=sin(2*pi*((4*(f/fs))*i));
    end
end
subplot(4,1,3);
plot(x);
title("FSK Modulated Signal");
xlabel('Number of Samples');
ylabel('Amplitude');

for i=0:n-1
    if (x(i+1))==sin((2*pi*(f/fs)*i))
        x(i+1)=1;
    else
        x(i+1)=0;
    end
end


subplot(4,1,4);
plot(x);
title("FSK De-Modulated Signal");
xlabel('Number of Samples');
ylabel('Amplitude');