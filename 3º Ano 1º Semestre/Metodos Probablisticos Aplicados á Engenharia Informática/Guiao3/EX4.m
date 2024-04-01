%% a e b
%    A    B   C   D
% A 0.16  0   0   0.36
% B 0.36  0   0   0.24
% C 0.24  0   0   0.24
% D 0.24  1   1   0.16
T = [0.16 0 0 0.36;
    0.36 0 0 0.24;
    0.24 0 0 0.24;
    0.24 1 1 0.16];
x0 = [1; 0; 0; 0];
x5 = T^5*x0
x10 = T^10*x0
x100 = T^100*x0
x200 = T^200*x0


%% c
T = [0.16 0 0 0.36;
    0.36 0 0 0.24;
    0.24 0 0 0.24;
    0.24 1 1 0.16];
n = length(T);
% (T-I)u aumentado com u1 + u2
M = [T-eye(n);ones(1,n)];
% x = vetor resultado sistema de equações
x = [zeros(n,1);1];
u = M\x;