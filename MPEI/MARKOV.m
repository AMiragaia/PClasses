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

%Simule a geração de 10^6 palavras aleatórias(use uma variavel do tipo cell
%array para guardar todas as palavras geradas) para obter uma lista de
%palavras geradas

N = 1e6; % Número de palavras a serem geradas
words = cell(N, 1); % Inicializa a cell array para armazenar as palavras

% Mapeamento de estados para letras, assumindo que temos um mapeamento correspondente
% Por exemplo, {1: 'A', 2: 'C', 3: 'O', 4: 'R', 5: 'T', 6: 'FIM'}
state_to_letter = {'A', 'C', 'O', 'R', 'T', 'FIM'};

for n = 1:N
    states = crawl(T,1,6); % Gera estados a partir da matriz de transição T
    word = ''; % Inicializa a palavra vazia
    for state = states
        if state == 6 % Se o estado corresponde a 'FIM'
            break; % Encerra o loop, pois a palavra está completa
        end
        word = [word state_to_letter{state}]; % Concatena a letra correspondente ao estado
    end
    words{n} = word; % Armazena a palavra gerada na cell array
end