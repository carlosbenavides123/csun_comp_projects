% Define the function f[n] = e‐n/4 sin(πn/10)u[n] using Matlab 
% inline function. Plot this 
% function using stem command over [‐5, 20]. 

func = inline('exp(-n/4).*sin((pi.*n)/10).*heaviside(n)', 'n');
n = [-5:20]
func(n);
stem(n, func(n));
xlabel('n');
ylabel('func(n)');
grid on;

% Use Matlab inline and stem functions to plot u[n] and [n] over [‐10, 10]. 

func = inline('heaviside(n)', 'n')
n = [-10:10]
func(n)
stem(n, func(n));
xlabel('n');
ylabel('func(n)');
grid on;


% Perform research to find out what Matlab filter function does. Explain how you can use this 
% function to calculate zero‐state response. Consider the interval [0, 30]: 
%     y[n+2] – 0.6y[n+1] ‐ 0.16y[n] = 5x[n+2] 

% a) Find zero‐state response if the input is x[n] = (4)‐nu[n]. 
% b) Find zero‐state response if the input is x[n] = cos(2πn/6)u[n] 
% c) Find impulse response of the system. 
% d) Find zero input response to the system with y[‐1]=1 and y[‐2]=2 using Matlab filtic
% function. 
% e) Find total response using input in part (b) and initial conditions in part (d). 

% a) and b) input is zero when considering zero-state

% a
n=0:1:30
a=[1 -0.6 -0.16]
b=[5 0 0]
func_a = 4-(n.*n>=0)
y_a=filter(b, a, func_a)

figure(1)
subplot(321)
stem(n,y_a)
title('Zero state response for a_x(n)')
xlabel('n')
ylabel('y_a(n)')

% b
n=0:1:30
a=[1 -0.6 -0.16]
b=[5 0 0]
func_b = cos(2*pi*n/6).*(n>=0)
y_b=filter(b, a, func_b)

figure(1)
subplot(322)
stem(n,y_b)
title('Zero state response for a_x(n)')
xlabel('n')
ylabel('y(n)')

% c
a=[1 -0.6 -0.16]
b=[5 0 0]
h=impz(b,a)
subplot(323)
stem(h)
title('Impulse response')
xlabel('n')
ylabel('h(n)')

% d
x = 0
func_d = filter(b, a, x, filtic(b, a, [1 2], 0));
subplot(324)
stem(func_d)
title('Zero input response y(n)')
xlabel('n')
ylabel('y(n)')

% e
total=y_a+y_b
subplot(325)
stem(total)
title('total response y(n)')
xlabel('n')
ylabel('y(n)')

% Use Matlab conv function to plot the convolution of the following two functions: 
%     x[n] = (0.8)nu[n]  and  h[n] = (0.3)nu[n] 
% consider the first 10 terms of each function. 

n = 0:10
x = (0.8).^n
h = (0.3).^n
y = conv(x, h)
n = 0:(length(y)-1)
plot(y, n)