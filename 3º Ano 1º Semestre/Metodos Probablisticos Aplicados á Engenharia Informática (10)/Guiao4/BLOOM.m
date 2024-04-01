% Parâmetros para gerar palavras
N_U1 = 1000; % Número de palavras para U1
N_U2 = 10000; % Número de palavras para U2
imin = 3; % Comprimento mínimo da palavra
imax = 10; % Comprimento máximo da palavra
caracteres = char(97:122); % Caracteres de 'a' a 'z'

% Gerar conjuntos U1 e U2
U1 = gerarChaves(N_U1, imin, imax, caracteres);
U2 = gerarChaves(N_U2, imin, imax, caracteres);
% Exemplo de como usar as funções
n = 8000; % Tamanho do Bloom Filter
k = 3;    % Número de funções de dispersão
bloomFilter = inicializarBloomFilter(n, k);

% Inserir elementos do conjunto U1 no Bloom Filter
for i = 1:length(U1)
    bloomFilter = inserirElemento(bloomFilter, U1{i});
end

% Testar pertença dos elementos de U1
falsosNegativos = 0;
for i = 1:length(U1)
    if ~verificarElemento(bloomFilter, U1{i})
        falsosNegativos = falsosNegativos + 1;
    end
end

% Testar pertença dos elementos de U2
falsosPositivos = 0;
for i = 1:length(U2)
    if verificarElemento(bloomFilter, U2{i})
        falsosPositivos = falsosPositivos + 1;
    end
end

percentagemFalsosPositivos = falsosPositivos / length(U2) * 100;
fprintf('Percentagem de Falsos Positivos: %f%%\n', percentagemFalsosPositivos);


function bloomFilter = inicializarBloomFilter(n, k)
    % Inicializa um Bloom Filter com tamanho n e k funções de hash
    bloomFilter = struct();
    bloomFilter.array = zeros(1, n);
    bloomFilter.k = k;
    bloomFilter.n = n;
end

function bloomFilter = inserirElemento(bloomFilter, elemento)
    % Insere um elemento no Bloom Filter
    for i = 1:bloomFilter.k
        % Supondo que hashFunction é uma função de dispersão adequada
        idx = DJB31MA(elemento, i, bloomFilter.n) + 1;
        bloomFilter.array(idx) = 1;
    end
end

function pertence = verificarElemento(bloomFilter, elemento)
    % Verifica se um elemento pertence ao Bloom Filter
    pertence = true;
    for i = 1:bloomFilter.k
        idx = DJB31MA(elemento, i, bloomFilter.n) + 1;
        if bloomFilter.array(idx) == 0
            pertence = false;
            break;
        end
    end
end

function keys = gerarChaves(N, imin, imax, caracteres)
    % Esta função gera um conjunto de chaves únicas (palavras).
    % N é o número de chaves a serem geradas.
    % imin e imax definem o comprimento mínimo e máximo de cada chave.
    % 'caracteres' é um vetor contendo os caracteres possíveis para as chaves.

    keys = cell(1, N); % Inicializa o array de chaves

    for i = 1:N
        len = randi([imin, imax]); % Escolhe um comprimento aleatório
        chave = caracteres(randi(numel(caracteres), 1, len));
        while ismember(chave, keys)
            chave = caracteres(randi(numel(caracteres), 1, len)); % Gera uma nova chave se já existir
        end
        keys{i} = chave; % Adiciona a chave única ao array
    end
end
