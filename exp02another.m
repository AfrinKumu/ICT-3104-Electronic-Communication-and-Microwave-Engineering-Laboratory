%Code for Amplitude Modulation..
clc;
close all;
clear all;
%input the values
A = input('Enter amplitude: ');
fm = input('Enter Message frequency: ');  %fm<fc
fc = input('Enter Carrier frequency: ');
m =  0.5;               %input('Enter modulation index');  %m <= 1
Fs=600;
t = 0:1/Fs:1;

%Equation of the message signal
y1 = A*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,y1,'blue','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Message signal','color','red');

%Equation of carrier signal
y2 = cos(2*pi*fc*t);
subplot(4,1,2);
plot(t,y2,'green','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier signal','color','blue'); 


%instantaneous voltage of resulting am wave is..
y = (1+sin(2*pi*fm*t)).*cos(2*pi*fc*t);
subplot(4,1,3);
plot(t,y,'red','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Modulated signal','LineWidth',1);

% Frequency Domain Analysis using FFT
N = length(y);                        % Length of the AM signal
AM_spectrum = fft(y)/N;                  % FFT of the AM signal and normalize
frequencies = (0:(N/2)-1) * Fs / N;              % Frequency axis from 0 to Nyquist frequency

% Plot AM signal Spectrum
subplot(4,1,4);
stem(frequencies, abs(AM_spectrum(1:floor(N/2))), 'blue', 'Linewidth', 1);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum(AM)');
grid on;
%input 1 5 150