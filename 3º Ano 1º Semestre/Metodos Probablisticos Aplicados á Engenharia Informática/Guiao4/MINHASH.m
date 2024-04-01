clear all;

% Carregar os dados
udata = load('u.data');
u = udata(1:end,1:2);
clear udata;

% Obter os utilizadores únicos
users = unique(u(:,1));
Nu = length(users);

% Construir a lista de filmes para cada utilizador
Set = cell(Nu,1);
for n = 1:Nu
    ind = find(u(:,1) == users(n));
    Set{n}= u(ind,2);
end

valoresK = [50, 100, 200];  % Diferentes valores de K
threshold = 0.4;  % Limiar de decisão

% Loop para cada valor de K
for K = valoresK
    % Cálculo das MinHash
    tic
    MinHashValue = inf(Nu, K);
    for i = 1: Nu
        conjunto = Set{i};
        for j = 1: length(conjunto)
            chave = char(conjunto(j));
            hash = zeros(1,K);
            for kk = 1:K
                chave = [chave num2str(kk)];
                hash(kk) = DJB31MA(chave, 127);
            end
            MinHashValue(i,:) = min([MinHashValue(i,:); hash]);
        end
    end
    fprintf('Tempo de cálculo das MinHash (K=%d) = %f\n', K, toc);

    % Cálculo das distâncias de Jaccard
    tic
    J = zeros(Nu);
    for n1 = 1:Nu
        for n2 = n1+1:Nu
            J(n1,n2) = sum(MinHashValue(n1,:) ~= MinHashValue(n2,:))/K;
        end
    end
    fprintf('Tempo de cálculo das distâncias dadas por MinHash (K=%d) = %f\n', K, toc);

    % Encontrar os pares de usuários similares
    tic
    SimilarUsers = [];
    for n1 = 1:Nu
        for n2 = n1+1:Nu
            if J(n1,n2) <= threshold
                SimilarUsers = [SimilarUsers; [users(n1) users(n2) J(n1,n2)]];
            end
        end
    end
    fprintf('Tempo de cálculo dos utilizadores mais similares (K=%d) = %f\n', K, toc);
    fprintf('Número de pares mais similares (K=%d) = %d\n', K, size(SimilarUsers, 1));
    
    % Opcional: Salvar os resultados para cada valor de K
    saveFileName = sprintf('SimilarUsers_K%d.mat', K);
    save(saveFileName, 'SimilarUsers');
    SimilarUsers
end
