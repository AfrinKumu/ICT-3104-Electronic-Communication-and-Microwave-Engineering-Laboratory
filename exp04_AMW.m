%Code for Amplitude Modulation..
clc;
close all;
clear all;
%input the values
Am = input('Enter message signal amplitude: ');
Ac = input('Enter carrier signal amplitude: ');
fm = input('Enter Message frequency: ');  %fm<fc
fc = input('Enter Carrier frequency: ');
m =  Am/Ac;               %input('Enter modulation index');  %m <= 1
t = 0:0.001:1;

%Equation of the message signal
y1 = Am*sin(2*pi*fm*t);
subplot(3,1,1);
plot(t,y1,'blue','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Message signal','color','red');

%Equation of carrier signal
y2 = Ac*sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,y2,'green','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier signal','color','blue'); 


%instantaneous voltage of resulting am wave is..
y = Ac*(1+m*sin(2*pi*fm*t)).*sin(2*pi*fc*t);
subplot(3,1,3);
plot(t,y,'red','LineWidth',1);
xlabel('Time'); 
ylabel('Amplitude'); 
title('Modulated signal','LineWidth',1);

%input 2 4 5 100