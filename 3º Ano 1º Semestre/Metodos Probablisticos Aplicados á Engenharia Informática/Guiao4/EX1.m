% Definição dos parâmetros
N = 10^5; % Número de chaves
imin = 6; % Comprimento mínimo da chave
imax = 20; % Comprimento máximo da chave

% Caracteres para o exercício 1a (todas as letras maiúsculas e minúsculas)
caracteres1 = ['A':'Z', 'a':'z'];

% Caracteres para o exercício 1b (apenas letras minúsculas)
% Nota: As probabilidades reais devem ser carregadas de 'prob_pt.txt'
caracteres2 = ['a':'z']; 
probabilidades2 = rand(1, length(caracteres2)); % Exemplo com probabilidades aleatórias

% Invocação da função para o exercício 1a
chaves1a = gerarChaves(N, imin, imax, caracteres1);

% Invocação da função para o exercício 1b
chaves1b = gerarChaves(N, imin, imax, caracteres2, probabilidades2);

% Impressão de algumas chaves geradas como amostra
disp('Algumas chaves do exercício 1a:');
disp(chaves1a(1:10));

disp('Algumas chaves do exercício 1b:');
disp(chaves1b(1:10));
save('chaves1a.mat', 'chaves1a');
save('chaves1b.mat', 'chaves1b');
% Função para gerar chaves
function keys = gerarChaves(N, imin, imax, caracteres, probabilidades)
    % Esta função gera um conjunto de chaves únicas com caracteres específicos.
    % N é o número de chaves a serem geradas.
    % imin e imax definem o comprimento mínimo e máximo de cada chave.
    % 'caracteres' é um vetor contendo os caracteres possíveis para as chaves.
    % 'probabilidades' é um vetor com as probabilidades de cada caractere.
    % Se 'probabilidades' não for fornecido, os caracteres são considerados equiprováveis.

    % Verifica se o vetor de probabilidades foi fornecido.
    if nargin < 5
        probabilidades = ones(1, length(caracteres)) / length(caracteres);
    end

    % Normaliza as probabilidades para garantir que a soma seja 1.
    probabilidades = probabilidades / sum(probabilidades);

    % Inicializa o array de chaves.
    keys = cell(1, N);

    % Gera cada chave.
    for i = 1:N
        % Determina o comprimento aleatório da chave.
        compChave = randi([imin, imax]);

        % Gera a chave com o comprimento especificado.
        chave = '';
        for j = 1:compChave
            % Escolhe um caractere aleatório com base nas probabilidades.
            chave = [chave, caracteres(find(rand <= cumsum(probabilidades), 1))];
        end

        % Verifica se a chave gerada já existe. 
        while any(strcmp(keys, chave))
            chave = '';
            for j = 1:compChave
                chave = [chave, caracteres(find(rand <= cumsum(probabilidades), 1))];
            end
        end

        % Adiciona a chave única ao array.
        keys{i} = chave;
    end
end


