clc;
clear all;
m =[1 1 0 0];
f = [0 0.5 0.5 1]; 
b = fir2(20, f, m);
b = transpose(b)
norm = b * (32767/sum(abs(b)))
