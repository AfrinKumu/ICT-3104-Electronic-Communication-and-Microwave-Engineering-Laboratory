%Frequenct Shift Keying... 
clc; 
close all; 
clear all; 
fc1=input('Enter the freq of 1st Sine Wave carrier:'); 
fc2=input('Enter the freq of 2nd Sine Wave carrier:'); 
fp=input('Enter the freq of Periodic Binary pulse (Message):'); 
amp=input('Enter the amplitude (For Both Carrier & Binary Pulse Message):'); 
t=0:0.001:1; % For setting the sampling interval 
% For Generating 1st Carrier Sine wave 
c1=amp.*sin(2*pi*fc1*t); 
% For Generating 2nd Carrier Sine wave 
c2=amp.*sin(2*pi*fc2*t); 
subplot(4,1,1); %For Plotting The Carrier wave 
plot(t,c1,'blue','Linewidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier 1 Wave'); 
subplot(4,1,2) %For Plotting The Carrier wave 
plot(t,c2,'blue','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Carrier 2 Wave'); 
%For Generating Square wave message 
m=amp/2.*square(2*pi*fp*t)+amp/2; 
subplot(4,1,3); %For Plotting The Square Binary Pulse (Message) 
plot(t,m,'red','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Binary Message Pulses'); 
for i=0:1000 %here we are generating the modulated wave 
if m(i+1)==0 
mm(i+1)=c2(i+1); 
else 
mm(i+1)=c1(i+1); 
end 
end 
subplot(4,1,4); %For Plotting The Modulated wave 
plot(t,mm,'green','LineWidth',1); 
xlabel('Time'); 
ylabel('Amplitude'); 
title('Modulated Wave');
%input 10 30 5 4