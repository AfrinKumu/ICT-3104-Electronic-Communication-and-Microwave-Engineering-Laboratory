clc;
close all;
clear all; 
%input the values
vm = input('Enter message signal Amplitude: ');
vc = input('Enter carrier signal Amplitude: ');
fm = input('Enter Message Frequency: ');  %fm<fc
fc = input('Enter Carrier frequency: ');
m = input('Enter modulation index: ');
t = 0:0.001:1;
Fs=1000;
%Equation of the message signal
y1 = vm*cos(2*pi*fm*t);
subplot(4,1,1);
plot(t,y1,'blue','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Message Signal','color','red'); 
grid on;
%carrier
y2 = vc*cos(2*pi*fc*t);
subplot(4,1,2);
plot(t,y2,'magenta','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier Signal','color','blue'); 
grid on;
%The instantaneous value of FM voltage wave is given by.........
y = vc*cos(2*pi*fc*t+m.*sin(2*pi*fm*t));
subplot(4,1,3);
plot(t,y,'red','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('FM Signal','color','red'); 
grid on;

%Compute the one sided spectrum using FFT
N = length(y);
FM_spectrum = fft(y)/N;
frequencies = (0:(N/2-1))*Fs/N;

%Plot the FM Spectrum
subplot(4,1,4);
stem(frequencies,abs(FM_spectrum(1:floor(N/2))),'red','LineWidth',1);
axis([0 200 0 1]);
xlabel('Frequency (Hz)'); 
ylabel('Amplitude'); 
title('FM Signal Spectrum'); 
%sample_input 2 4 5 100 10