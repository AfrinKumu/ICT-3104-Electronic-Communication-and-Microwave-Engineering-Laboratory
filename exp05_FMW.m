%Code for Frequency Modulation.... 
clc; 
close all; 
clear all; 
%Input the values..... 
vm = input('Enter Message signal amplitude = '); 
vc = input('Enter Carrier signal Amplitude = '); 
fm = input('Enter Message frequency = '); 
fc = input('Enter Carrier frequency = '); 
m = input('Enter Modulation Index = ');    % Modulation index (m)>=1              
t = 0:0.001:1;               %upto 1000 samples 
%Equation of Message Signal...   
y1 = vm * cos(2*pi*fm*t);  
subplot(3,1,1);  
plot(t,y1,'blue','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Message Signal','color','red'); 
grid on; 
%Equation of Carrier Signal...       
y2 = vc*cos(2*pi*fc*t); 
subplot(3,1,2); 
plot(t,y2,'red','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier Signal','color','blue'); 
grid on; 
%The instantaneous value of FM voltage wave is given by......... 
y = vc*cos(2*pi*fc*t+m.*sin(2*pi*fm*t)); % Equation of Modulated signal    
subplot(3,1,3); 
plot(t,y,'green','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('FM Signal','color','red'); 
grid on;
%input 2 4 5 100 10