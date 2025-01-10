clc;
close all;
clear all;

% Parameters
Am = 2; % Message amplitude
Ac = 4;        % Carrier amplitude
fm = 100;      % Message signal frequency (Hz)
fc = 1000;     % Carrier frequency (Hz)
fs = 10000;    % Sampling frequency (Hz)
t = 0:1/fs:0.1; % Time vector (0.1 seconds duration)
m= 0.5;

% Generate message,carrier and AM signal
y1 = Am * sin(2 * pi * fm * t);               % Message signal
y2= Ac * sin(2*pi*fc*t);  
y= Ac*(1+m*sin(2*pi*fm*t)).*sin(2*pi*fc*t); 

% Plotting
figure;

subplot(5, 1, 1);  
plot(t, y1, 'b');  
title('Message Signal');  
xlabel('Time (s)');  
ylabel('Amplitude');  

subplot(5, 1, 2);  
plot(t,y2, 'b');  
title('Carrier Signal');  
xlabel('Time (s)');  
ylabel('Amplitude');  

subplot(5, 1, 3);
plot(t,y,'b');
title('AM Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Diode detector (half-wave rectification)
rectified_signal = max(y, 0);                % Only positive part of the signal
% Plot the rectified signal
subplot(5, 1, 4);
plot(t, rectified_signal, 'r');
title('Rectified Signal (Diode Detector Output)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
% Low-pass filter to extract the message signal
fc_lpf = 2 * fm;                             % Low-pass filter cutoff frequency (2*fm)
[b, a] = butter(6, fc_lpf / (fs / 2));       % 6th-order Butterworth filter
demodulated_signal = filter(b, a, rectified_signal);

% Plot the demodulated signal (message signal)
subplot(5, 1, 5);
plot(t, demodulated_signal, 'g', 'LineWidth', 1.5);
hold on;
plot(t,y1, 'k--', 'LineWidth', 1);  % Overlay the original message signal for comparison
title('Demodulated Signal (Extracted Message)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Demodulated Signal', 'Original Message');
grid on;