clear all;
clc

load chaves1a.mat; % Carregar o conjunto de chaves
tamanhosHashTables = [5e5, 1e6, 2e6]; % Definir os tamanhos das Hash Tables
tiposHash = {'djb2', 'sdbm', 'DJB31MA', 'hashstring'};

% Loop para cada tipo de função hash
for idxTipo = 1:length(tiposHash)
    tipoHash = tiposHash{idxTipo};

    % Loop para cada tamanho de Hash Table
    for idxTamanho = 1:length(tamanhosHashTables)
        tamanho = tamanhosHashTables(idxTamanho);
        [numColisoes, maxAtribuicoes, tempoExecucao, momentos, hashCodes] = simularHashTable(chaves1a, tipoHash, tamanho);

        % Visualização dos histogramas dos hash codes
        figure;
        histogram(hashCodes / tamanho, 100);
        title(sprintf('Histograma para %s - Tamanho: %d', tipoHash, tamanho));

        % Imprimir resultados
        imprimirResultados(tipoHash, tamanho, numColisoes, maxAtribuicoes, tempoExecucao, momentos);
    end
end

function [numColisoes, maxAtribuicoes, tempoExecucao, momentos, hashCodes] = simularHashTable(chaves, tipoHash, tamanho)
    % Inicialização
    tabela = zeros(1, tamanho);
    hashCodes = zeros(1, length(chaves));
    contColisoes = 0;
    tic; % Iniciar cronómetro

    % Processamento das chaves
    for i = 1:length(chaves)
        hashCode = calcularHashCode(chaves{i}, tipoHash, tamanho);
        hashCodes(i) = hashCode;

        if tabela(hashCode) > 0 
            contColisoes = contColisoes + 1;
        end
        tabela(hashCode) = tabela(hashCode) + 1;
    end

    % Calcular métricas
    tempoExecucao = toc; % Tempo de execução
    hNormalizados = hashCodes / tamanho;
    momentos = [mean(hNormalizados.^2), mean(hNormalizados.^5), mean(hNormalizados.^10)];
    numColisoes = contColisoes;
    maxAtribuicoes = max(tabela);
end

function imprimirResultados(tipoHash, tamanho, numColisoes, maxAtribuicoes, tempoExecucao, momentos)
    fprintf('Tipo de Hash: %s, Tamanho da HashTable: %d\n', tipoHash, tamanho);
    fprintf('Número de Colisões: %d\n', numColisoes);
    fprintf('Máximo de Atribuições: %d\n', maxAtribuicoes);
    fprintf('Tempo de Execução: %f segundos\n', tempoExecucao);
    fprintf('Momento 2: médio - %f, teórico - %f\n', momentos(1), 1/3);
    fprintf('Momento 5: médio - %f, teórico - %f\n', momentos(2), 1/6);
    fprintf('Momento 10: médio - %f, teórico - %f\n\n', momentos(3), 1/11);
end

function hashCode = calcularHashCode(chave, tipoHash, tamanho)
    if strcmp(tipoHash, 'DJB31MA')
        hashCode = mod(DJB31MA(chave, 127), tamanho) + 1;
    elseif strcmp(tipoHash, 'hashstring')
        hashCode = mod(hashstring(chave, tamanho), tamanho) + 1;
    else % 'djb2' ou 'sdbm'
        hashCode = mod(string2hash(chave, tipoHash), tamanho) + 1;
    end
end
function hash = string2hash(str, type)
    % Converte a string para um array de double
    str = double(str);

    % Define o tipo padrão para 'djb2' se não for fornecido
    if nargin < 2
        type = 'djb2';
    end

    % Implementação dos métodos de hash
    switch(type)
        case 'djb2'
            hash = 5381 * ones(size(str,1),1); 
            for i = 1:size(str,2)
                hash = mod(hash * 33 + str(:,i), 2^32-1); 
            end
        case 'sdbm'
            hash = zeros(size(str,1),1);
            for i = 1:size(str,2)
                hash = mod(hash * 65599 + str(:,i), 2^32-1);
            end
        otherwise
            error('string_hash:inputs', 'unknown type');
    end
end

