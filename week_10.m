
%% radar ranging using cross-correlation
clear all;
clc
ts = 0.01;
tf = 10;       % final time
t= 0:ts:tf-ts;  % number of sampling = (tf-ts)/ts +1
Tw = 1; % pulse width
Td = 3; % time delay of the received signal w.r.t the send signal
% timeDelay = 0.5;

Tx = heaviside(t)- heaviside(t-Tw);
Rx = [zeros(1,Td/ts)  Tx(1:tf/ts-Td/ts)];
figure(1)
plot(t,Tx);grid on; hold on
axis([ 0 10 -1 2])
plot(t,Rx)
hold off

Kim = xcorr(Rx, Tx);
[T, L] = max(Kim);   % at the L th value of Kim is maximum
estTd =L*ts - tf;     % estimation of time delay since cross correlation in  the range of -tf < t   < tf
figure(2)
plot(-tf+ts:ts:tf-ts,Kim); grid on

%%  matlab function example 
%  https://www.mathworks.com/help/matlab/ref/function.html
clear all; clc
x = 1:99;
ave = average_Kim(x);

values  = [12.7 45.4 98.9 26.6 53.1];
[ave, stdev] = stat_Kim(values);


% anonymous function 
sqr = @(x) x.^2;
a = sqr(5);

%% integral
% integralnd = x^2 + x +1
% lower = 0, upper = 1
clear all;clc

g = integral(@(x) (x.^2 +x +1), 0, 1)

%% Ch. 4.2.2 impulse response function using Wiener

clear all; clc;clf
ts = 0.5;      % sampling time
N = 50;
t = 0:ts:N*ts - ts;
num = [1];
den = [1 3];
sys=tf(num,den);
for i = 1:N
   temp(i) = sin(sin(2*pi*t(i))); 
    if temp(i) > 0    
        u(i)  = 1;
    else
        u(i) = 0;
    end 
end 
figure(1)
% plot(t,u); grid on
plot(t,u); grid on; hold on
y = lsim(sys, u,t);
% yNoise = y + 0.1*randn(N,1);
plot(t,y,'r');
% plot(t,y,'r', t,yNoise,'k');
hold off

[g,SNR,yEst] = wiener_hopf(u,y,N);
% [gNoise,SNR,yEstNoise] = wiener_hopf(u,yNoise,N);
figure(2)
plot(g); grid on; hold on;
Realg = exp(-3*t);
plot(Realg,'r')
% plot(gNoise,'k')
hold off
figure(3)
plot(t,y,t,yEst)
% plot(t,yEstNoise); grid on













