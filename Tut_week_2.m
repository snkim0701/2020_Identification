
%% linear equation
clear all; clc

A = [1 2 3 ; 4 5 6 ; 7 8 9];
B = A'
C= A*B
 
%% linear equation
clear all; clc

A = [2 3 4 ; 5 6 7; 8 9 1];
B = [ 3 4 5; 6 7 8; 9 1 2];
det(A)
det(B)

det(A)*det(B)
det(A*B)   % check det(A)det(B) = det(AB)

%% solving a linear equation

clear all; clc
A =[2 4 2; 4 9 -3; 2 3 7];
b = [2;8;10];
x = inv(A)*b
% verify Ax = b
A*x-b

%% exponetial function 
clear all;clc
y = 0;
for i = 1:10
    x(i) = (1+ 1/i)^i
end
x'
exp(1)
plot(x); grid on
%% eigenvalue and eigen vector 2x2
clear all;clc
A =[2 1;1 2];
[V,D] = eig(A)

% verify the result
B = [0 -1; 1 0];
[V,D] = eig(B)

% verify the result

%%   eigenvalue and eigen vector 3x3
clear all;clc
A =[1 1 2;1 2 1; 2 1 1 ];
[V,D] = eig(A)



