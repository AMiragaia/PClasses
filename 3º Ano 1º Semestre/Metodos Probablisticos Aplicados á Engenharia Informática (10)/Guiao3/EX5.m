close all;
close all;
clc;
%% a)
T = [0.7 0.2 0.3;
     0.2 0.3 0.3;
     0.1 0.5 0.4]';

%% b)
% 1 no sol e 0 nos restantes
x0 = [1 ; 0; 0];
x1 = T^2*x0;
fprintf("A probabilidade de estar sol no segundo e no terceiro dia, ");

%% c)
sol = 1;
nuvens = 2;
chuva = 3;
p_c = T(sol,sol)*T(sol,sol)+T(nuvens,sol)*T(sol,nuvens)+T(nuvens,sol)*T(nuvens,nuvens)+T(sol,sol)*T(nuv
