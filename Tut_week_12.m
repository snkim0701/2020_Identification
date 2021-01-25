%%%% a sample program
%y(t) =  u(t-1) + 0.5u(t-2) + e(t)
A = [1];
B = [0 1 0.5];  
sys0 = idpoly(A,B)         % original system
                                 % check the sys0 with the 
   % generate input and noise
u = iddata([ ],idinput(300,'rbs'));
e = iddata([ ],randn(300,1));
 
% generate output
y = sim(sys0,[u e]);
 
% for regressor matix, 
z = [y,u];
figure(1)
idplot(z); grid on
 
% LSE 
sys = arx(z,[0 2 1])    % estimate system
 
% compare the real output with the output of the LSE system
ye =sim(sys,[u e]);
figure(2)
plot(y,'b');grid on;  hold on
plot(ye,'r');
title('FIR sytem : real output(blue) with LSE output(red)')
hold off

%% comparison
%                 Unknown system x(t) : y(t)= u(t-1) + 0.5u(t-2)
%                 Number of the sampling : 300
%                 Input: Random binary Sequence 
%                 Measurement noise: Gaussian ~ N(0,1)
%                 Measured data : sim(sys0,[u,e])
%                 %%LSE results
%                 B(z)=1.01z^(-1)+0.5077z^(-2)         


%% ARX

%y(t) = 1.5y(t-1) - 0.7y(t-2) + u(t-1) + 0.5u(t-2)
A = [1  -1.5  0.7];
B = [0 1 0.5];
sys0 = idpoly(A,B);
 
u= iddata([ ],idinput(300,'rbs'));
e = iddata([ ],randn(300,1));
 
% input = sin wave
% t = 0:0.1:29.9;
% input = sin(2*pi*t);
% u = iddata([ ],input',0.1);
% e = iddata([ ],randn(300,1),0.1);
 
% generate output
y = sim(sys0,[u e]);
 
% for regressor matix, 
z = [y,u];
figure(3)
idplot(z); grid on
 
% LSE 
sys = arx(z,[2 2 1])
 
%%%comparison
%                 Unknown system x(t): y(t) = 1.5y(t-1) -0.7y(t-2) + u(t-1) + 0.5u(t-2)
%                 Number of the sampling: 300
%                 Input: Random binary Sequence 
%                 Measurement noise: Gaussian ~ N(0,1)
%                 Measured data: sim(sys0,[u,e])
%                 %%LSE results
%                 A(z)=1-1.529z^(-1)+0.7209z^(-2)    
%                 B(z)=1.071z^(-1)+0.5066z^(-2)    

%%	ARMAX
% define a discrete system
%y(t) = 1.5y(t-1) - 0.7y(t-2) + u(t-1) + 0.5u(t-2) + e(t) + 0.5e(t-1)
A = [1  -1.5  0.7];
B = [0 1 0.5];
C = [1 0.5]
sys0 = idpoly(A,B,C)
u= iddata([ ],idinput(300,'rbs'));
e = iddata([ ],randn(300,1));
 
% generate output
y = sim(sys0,[u e]);
 
% for regressor matix, 
z = [y,u];
figure(5)
idplot(z); grid on
 
% LSE 
sys = armax(z,[2 2 1 1])
 

%%%comparison
%                 Unknown system x(t): y(t) = 1.5y(t-1) -0.7y(t-2) + u(t-1) + 0.5u(t-2)+e(t)+0.5e(t-1)
%                 Number of the sampling: 300
%                 Input: Random binary Sequence 
%                 Measurement noise: Gaussian ~ N(0,1)
%                 Measured data: sim(sys0,[u,e])
%                 %%LSE results
%                 A(z)=1-1.529z^(-1)+0.7209z^(-2)    
%               B(z)=0.9549z^(-1)+0.4621z^(-2)  
%               C(z)=1+0.4239z^(-1)   
