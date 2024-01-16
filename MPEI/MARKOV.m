% Ordenação da matriz sobre a forma Tji
%     1 2 3 4 5 META (n(i) -> vertical (cada linha)  
%   e 1 2 3 4 5 META para (n+1(j) -> horizontal(cada coluna))

T= [0.2 0.4 0.1 0
    0.4 0.3 0.1 0.1
    0.3 0.3 0.8 0.1
    0.1 0   0   0.8];

% (a) (3.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, estar no estado 4 após 5 transições?
% (b) (2.0 valores) Qual a probabilidade de o sistema, começando no
%     estado 2, manter-se no estado 2 nas 5 primeiras transições?

%
T5 = T^5;
% a probabilidade de estar no estado 4 passado 5 transiçpes e de T5(4,2));

% A probabilidade de estar no estado 2 passado 5 transições é de %f.\n\n', T5(2,2))

%para numero medio
%obter Q (sub-matriz) que descreve probabilidades de transiçao de estados
%nao absorventes
%calcular F
Q = T(1:5,1:5);
%% F
%%aux = eye(size(Q))-Q)
%%F = inv(aux)
F = inv(eye(length(Q)) - Q);
%soma da primeira coluna começando no primeiro estado
numero_medio = sum(F(:,1))+1;

%Tempos medios ate absorvaçao
%sum(F) em vetor linha
%t = F'*ones(3,1): em vetor coluna
