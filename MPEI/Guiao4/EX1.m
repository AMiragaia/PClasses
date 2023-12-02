%%a

N = 1e5;
alpha = ['a':'z' 'A':'Z'];
keys = generateKeys(N,6, 20, alpha);

%%b
N = 1e5;
alpha = 'a':'z';
prob = load("prob_pt.txt");
keys_prob = generateKeys(N,6, 20, alpha, prob);

%% function
function keys = generateKeys(N, imin, imax, characters, probabilities)
    if nargin < 5
        probabilities = ones(1, length(characters)) / length(characters);
    end

    keys = cell(1, N);
    keyCount = 0;

    while keyCount < N
        keyLength = randi([imin, imax]);
        key = char(randsample(characters, keyLength, true, probabilities));
        
        % Verifica se a chave já existe
        if ~any(strcmp(keys, key))
            keyCount = keyCount + 1;
            keys{keyCount} = key;
        end
    end
end

