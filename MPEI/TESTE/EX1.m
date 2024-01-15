%% a)

% 1.a) Representação da Matriz de Transição (T)

 a1 = 0.2;
 a3 = 0.3;
 a4 = 0.1;
 a5 = 0.45;
% Ordenação da matriz sobre a forma Tji
%     1 2 3 4 5 META (n(i) -> horizontal(cada coluna))  
%   e 1 2 3 4 5 META para (n+1(j) -> vertical(cada linha))
 T = [0, 0, 0, 0, 0, 0;
     a1, 0, 0, 0, 0, 0;
     0, 0, 0, a4, a5, 0;
     0, 0, a3, 0, 1-a5, 0;
     1-a1, 1, 1-a3, 0,0, 0;
     0, 0, 0, 1-a4,0,1];

 %% b)

% Caminho mais curto é 1->5->4->Meta


P1 = 1-a1;
P2 = 1-a5;
P3 = 1-a4;

PCurto = P1*P2*P3;
disp(PCurto)

%% c)


Q = T(1:5,1:5);



F = inv(eye(length(Q)) - Q);
numero_medio = sum(F(:,1))+1;



disp(numero_medio);

