% textbook problems: 5.M-8, 5.M-9, 9.M-4

% 5.M-8

% a
% Deisng an eigth-order digital lowpass filter with Ohm = pi/3

n = 8
Wc = pi/3 %cutoff
wn = Wc/10*pi
[b, a] = butter(n, wn)
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

% b
% Deisng an eigth-order digital highpass filter with Ohm = pi/3

n = 8
Wc = pi/3 %cutoff
wn = Wc/10*pi
[b, a] = butter(n, wn, 'high')
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)


% c
% Deisng an eigth-order digital bandpass filter between 5pi/24 and 11pi/24

n = 8
Wc1 = 5*pi/24 %lower cutoff
Wc2 = 11*pi/24 %upper cutoff
W1 = Wc1/10*pi
W2 = Wc2/10*pi
wn = [W1 W2]
[b, a] = butter(n, wn)
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

% d
% Deisng an eigth-order digital stoppass filter between 5pi/24 and 11pi/24

n = 8
Wc1 = 5*pi/24 %lower cutoff
Wc2 = 11*pi/24 %upper cutoff
W1 = Wc1/10*pi
W2 = Wc2/10*pi
wn = [W1 W2]
[b, a] = butter(n, wn, 'stop')
% stop filter;
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

%5.M-9
% redo 5.M-8 with chebyl

% a
n = 8
% 20*log(1+rp) =Rp, Rp = 3
rp = 0.414
Wc = pi/3 %cutoff
wn = Wc/10*pi
[b, a] = cheby1(n, rp, wn)
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

% b
n = 8
% 20*log(1+rp) =Rp, Rp = 3
rp = 0.414
Wc = pi/3 %cutoff
wn = Wc/10*pi
[b, a] = cheby1(n, rp, wn, 'high')
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

% c
n = 8
% 20*log(1+rp) =Rp, Rp = 3
rp = 0.414
Wc1 = 5*pi/24 %lower cutoff
Wc2 = 11*pi/24 %upper cutoff
W1 = Wc1/10*pi
W2 = Wc2/10*pi
wn = [W1 W2]
[b, a] = cheby1(n, rp, wn)
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

% d
n = 8
% 20*log(1+rp) =Rp, Rp = 3
rp = 0.414
Wc1 = 5*pi/24 %lower cutoff
Wc2 = 11*pi/24 %upper cutoff
W1 = Wc1/10*pi
W2 = Wc2/10*pi
wn = [W1 W2]
[b, a] = cheby1(n, rp, wn, 'stop')
w = 0:.1:pi
[h, om] = freqz(b, a, w)
m = 20*log(abs(h)) % magnitude
subplot(2, 1, 1);
plot(om/pi, m)
xlabel('Hz')
ylabel('gain');
subplot(2, 1, 2);
zplane(b, a)

% 9.M-4
% using equation
% 1/M * M-1 sum to k = 0 (H(k)e^((j*2*pi*n*k)/M))
% H(k) = H_k[2*pi/M(k + alpha)]*e^(j*w_h*k)
M = 8
alpha = (M-1)/2;
k1 = 0:floor((M-1)/2);
k2 = floor((M-1)/2)+1:M-1;
k = 0:M-1;
Hr = [0,3,0,3,0,3,0,3];
wn = [-alpha*2*pi*k1/M alpha*2*pi*(M-k2)/M];
H = Hr.*exp(j*wn);
h = real(ifft(H,M));
disp(h)
stem(wn, h)