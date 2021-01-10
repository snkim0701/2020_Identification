
%% prob 2.2  - exam. 2.1 
% ss representation
clear all; clc
k= 0.8  % gain of output
A =[-k];
B = [1];
C=[k];
D =0;
sys1 =ss(A,B,C,D)
%%
% transfer representation
num = [k];
den =[1 k];
sys2 = tf(num,den);

%% check ts2ss  ss2tf
[AT,BT,CT,DT]= tf2ss(num,den)
[numT,denT] = ss2tf(A,B,C,D)

%% impulse response
figure(1)
impulse(sys1); grid on;
figure(2)
impulse(sys2,'r'); grid on
figure(3)  % combine two figures
impulse(sys1,'b'); grid on; hold on
impulse(sys2,'+r'); 
hold off

%% step response
figure(4)
step(sys1); grid on

%% Using differential, find g(t)
StepKim = step(sys1);
ImpKim =impulse(sys1);

%%
figure(5)
DiffKim = diff(StepKim);
plot(DiffKim*ImpKim(1)/DiffKim(1)); grid on

%% [0, 1] check the system

u =[zeros(1,10) ones(1,100)];
t =linspace(0,11,110);
figure(6)
plot(t,u);grid on; hold on
axis([0 11, 0 2]); 
lsim(sys1,u,t,0)

%% prob 2.4
t = linspace(0,10,1000);
x = exp(-t) - exp(-5*t);
figure(6)
plot(t,x); grid on

figure(7)
u1=10*(heaviside(t)-heaviside(t-0.1));
u2 =2*(heaviside(t) - heaviside(t-0.5));
plot(t,u1,t,u2,'r')
figure(8)
Kim = conv(x,u1);
plot(Kim); grid on; hold on

u2 =2*(heaviside(t) - heaviside(t-0.5));
Kim = conv(x,u2);
plot(Kim,'r')