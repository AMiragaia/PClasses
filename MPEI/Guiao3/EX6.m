close all;
clear all;
clc;
%% a) Designar a matriz de transiçao de estados 
T = [0.8 0 0 0.3 0 ; 0.2 0.6 0 0.2 0 ; 0 0.3 1 0 0 ; 0 0.1 0 0.4 0 ; 0 0 0 0.1 1];

%% b)
x0 = [1 ; 0 ; 0 ; 0 ; 0]; %% T

n = 1:100; %% variavel n a variar entre 1:100
estado2 = zeros(1,100);
%% 
%%com n a variar de 1 ate ao 100
for i =1:100
    v = T^i*x0;
    estado2(i) = v(2);
end

plot(n, estado2);

%% c)
%usando do mesmo x0 acima 
n = 1:100;
estado3 = zeros(1,100);
estado5 = zeros(1,100);

for i =1:100
    v = T^i*x0;
    estado3(i) = v(3);
    estado5(i) = v(5);
end

plot(n, estado3, "r");
hold on;
plot(n, estado5, "g");

%% d)
Tcan = [0.8 0 0.3 0 0 ; 0.2 0.6 0.2 0 0 ; 0 0.1 0.4 0 0 ; 0 0.3 0 1 0 ; 0 0 0.1 0 1];

Q = Tcan(1:3,1:3)

%% f) 

F = inv(eye(length(Q))-Q)

%% g)
E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1));
fprintf("Nº passos a começar em 2: %f\n", E(2));
fprintf("Nº passos a começar em 4: %f\n", E(3));

%% g)
R = Tcan(4:5,1:3);
B = R*F;

fprintf("Começando no estado 1, prob. absorção do estado 3: %f\n", B(1,1));
fprintf("Começando no estado 1, prob. absorção do estado 5: %f\n", B(2,1));
