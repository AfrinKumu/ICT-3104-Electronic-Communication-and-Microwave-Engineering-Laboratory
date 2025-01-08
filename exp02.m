clc;
close all;
clear all;

% Parameters
Fs = 600;             % Sampling frequency (Hz)
Fm = 5;                % Message frequency (Hz)
Fc = 150;              % Carrier frequency (Hz)
A = 1;                 % Amplitude of the signals
m = 0.5;
% Time vector
t = 0:1/Fs:1;          % Time vector from 0 to 1 second with step size 1/Fs

% Message signal (y1) and Carrier signal (y2)
y1 = A*sin(2*pi*Fm*t);  % Message signal (sine wave)
y2 = cos(2*pi*Fc*t);    % Carrier signal (cosine wave)

subplot(4,1,1);
plot(t, y1, 'g', 'Linewidth', 1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message');
grid on;

subplot(4,1,2);
plot(t, y2, 'g', 'Linewidth', 1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier');
grid on;


% AM Modulated signal
y = (1 + y1).*y2;      % AM modulation formula

% Plot AM signal in Time Domain
subplot(4,1,3);
plot(t, y, 'r', 'Linewidth', 1);
xlabel('Time (s)');
ylabel('Amplitude');
title('AM Signal in Time Domain');
grid on;

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