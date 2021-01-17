
%% Example 5.3 , 5.11
clear all;clc;

% Example 5.3
t = 0:0.2:1;
y = [3 59 98 151 218 264]';
N = size(y,1);
p = 3;         % number of parameter
for i = 1: 6
    Phi(i,:) = [1 t(i)  t(i)^2/2];    
end
est =pinv(Phi)*y

%  Example 5.11 analysis
err = y -Phi*est;
meanE = mean(err);                        % mean 
varE =err'*err/(N-p);             % mean square error

%
CovEst = varE*inv(Phi'*Phi);
StanDev = sqrt(diag(CovEst));
Acc =StanDev ./est   % only velocity accurate

%% Examp. 5.14
[U, S,V]  =svd(Phi)

%% Kim 
clear all;clc;clf
x = 1:0.1:2;
a = 1.5;
y = (x-a).^2;
figure(1)
plot(x,y); grid on; hold on

% least square
est(1) = 1.1;
for i = 1:10
    S(i) = -2*(x(i) -est(i));
    W(i) = inv((S(i)'*S(i)))*S(i)';
    f(i)  = (x(i) - est(i))^2;
    est(i+1) = est(i) + W(i)*(y(i) - f(i));
end
figure(2)
plot(x,est); grid on
hold off


%%  Ex 5.22 - non-linear p96
     
clear all; clc; clf
t = [0 2 4 7 8 10 14 23 27 35]';
rmax =[0.268 0.305 0.347 0.399 0.499 0.504 0.431 ...
           0.735 0.809 0.930]';
plot(t,rmax);
B = 0.281; 

est(1,:) =[0.01 0.1];    % est = [b umax]

for j = 1:10     % recursive estimator    
    % generate Sensitivity function
    for i =1:size(t,1)
     C1(i) =-rmax(1)*t(i)*exp(-est(j,1)*t(i)) ...
           -(est(j,2)*B/est(1,1)^2)*(1-exp(-est(j,1)*t(i))) +est(1,2)*B*t(i)/est(j,1)*exp(-est(j,1)*t(i)); 
     C2(i) = B/est(j,1) * (1 - exp(-est(j,1)*t(i)));
     Sen(i,:) = [C1(i)  C2(i)];
    end
    
    % estimate 
    for i = 1: size(t,1)
    err(i) = rmax(i) -( rmax(1)*exp(-est(j,1)*t(i)) + est(j,2)*B*(1-exp(-est(j,1)*t(i)))/est(j,1));
    end
    est(j+1,:) =[est(j,1)   est(j,2)]' +inv(Sen'*Sen)*Sen'*err'
    
end

% result of recursive estimators
plot(t,rmax); grid on; hold on
for i = 1:10
est_rmax = rmax(1)*exp(-est(i,1)*t)+est(i,2)*B*(1-exp(-est(i,1)*t))/est(i,1);
plot(t,est_rmax)
pause
end

hold off
