

%% Empirical transfer function
clear all; clc
ts = 0.1;      % sampling time
t = 0:ts:999*ts;
num = [1];
den = [1 3];
sys=tf(num,den);
for i = 1:1000
   temp(i) = sin(sin(2*pi*0.1*t(i))); 
    if temp(i) > 0    
        u(i)  = 1;
    else
        u(i) = 0;
    end 
end 
figure(1)
% plot(t,u); grid on
plot(t,u); grid on

figure(2)
bode(sys); grid on
y = lsim(sys,u,t);

%
Dat = iddata(y,u',ts);
G = etfe(Dat);

figure(3)
bode(G); grid on

%% 
clear all; clc
num = 5;
den = [1 1];
sys1 = tf(num,den,'InputDelay',0.1);
sys2 = tf(num,den,'InputDelay',0.45);
figure(1)
subplot(2,1,1)
nyquist(sys1);
subplot(2,1,2)
nyquist(sys2);
grid on

%%  simulink verification
tau1=0.1;
tau2=0.2;
tau3=0.3;
tau4=0.45;  % unstable







