% What is the frequency and sampling period represented by the following sequence 
% of MATLAB instructions?

% T = 0.05; 
% n = 0:1:22; 
% figure; 
% stem(n*T, sin(2*pi*2*n*T))
% freq = 20Hz
% sampling rate ~= 40 Hz

% Plot a sine wave having three cycles over 18 samples, then the same sine wave, but 
% with a phase angle of π/2 radians, and finally a cosine wave having three cycles over 
% 18 samples and a zero phase angle. Display all three diagrams in one plot using 
% subplot. 

clear all;
clc;

x_1 = 0:1/6:3;
y_1 = sin(x_1*2*pi);
subplot(3, 1, 1);
plot(x_1, y_1);
xlabel('time');
grid on;

x_2 = 0:1/6:3;
y_2 = sin(x_2*2*pi+pi/2);
subplot(3, 1, 2);
plot(x_2, y_2);
xlabel('with phaseshift');
grid on;

x_3 = x_2
y_3 = cos(x_3*2*pi)
subplot(3, 1, 3)
plot(x_3, y_3)
xlabel("cosine")
grid on;

% Plot the function y[n] = 2^n over the interval [0, 9] 

clear all;
clc;

x = 0:1:9;
y = 2.^x
plot(x, y);
grid on;

% 4. Plot each of the following signals on the interval [0:31] 
% a. x[n] = sin(πn/4) cos(πn/4) 
% b. x[n] = cos^2(πn/4) 
% c. x[n] = sin(πn/4) cos(πn/8) 
% What is the period of the signal in each case? Use Matlab plots. Prove your answers 
% mathematically without relying on Matlab. 

clear all;
clc;
close all;
n = 0:1:31

y_a = sin((pi*n)/4).*cos((pi*n)/4);
subplot(3, 1, 1)
plot(n, y_a)
grid on;
% p = 4

y_b = cos((pi*n)/4).*cos((pi*n)/4);
subplot(3, 1, 2)
plot(n , y_b)
grid on;
% p = 4

y_c = sin((pi*n)/4).*cos((pi*n)/8);
subplot(3, 1, 3)
plot(n , y_c)
grid on;

% p = 20

% 5. Use Matlab to solve the following difference equation iteratively. 
% y[n] – 0.5y[n‐1] = x[n] 
% y[‐1] = 16 
% x[n] = n2 (starting at n=0) 