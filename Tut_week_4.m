%%  polar matrix 
% verificaion of Pythagorus
clear all

syms th
A = [ cos(th) sin(th)];
a =A(1)^2 + A(2)^2;
subs(a, th,pi);

% theta varies from 0 to pi radians with the increment 0.1 radian
I  = subs(a,th,0:0.1:pi);
plot(I); grid on

%% complex eigen values and eigen vector

M =[A ; -sin(th)  cos(th)]
[V, D]  = eig(M)

simplify(D)
simplify(V)

det(M)

%% singular value decomposition
% https://www.mathworks.com/help/matlab/ref/double.svd.html;jsessionid=4017993f190c959536129ed8f6f0
% googling singular value decomposition matlab


clear all;clc
A = [1 0 1; -1 -2 0; 0 1 -1];
S= svd(A);
[U,S,V] = svd(A)

% verification
U*S*V' - A

% singular values are different form the eigenvalues of A

[Vec, Val] = eig(A)
%% Singular values are the positive square root of the eigenvalue of A^T A
% sing
[Vec,Val] = eig(A'*A)
S'*S

%% another example
clear all; clc

A = [1 2; 3 4; 5 6; 7 8]
[U,S,V] = svd(A)

%verification
U*S*V'


%% Text book example
clear all; clc
A = [ 2 2 0;-1 1 0];
[U,S,V] = svd(A)


%%
