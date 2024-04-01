%%a
m = 300;  % Número de bits no filtro de Bloom
k = 1;    % Número de funções hash
pfp = 0.03; % Probabilidade de falso positivo desejada
N = 1;    % Valor inicial para o número de elementos

while true
    pfptest = (1 - exp((-k * m) / N))^k;
    if abs(pfp - pfptest) < 0.00001
        break
    end
    N = N + 1;
end

fprintf("Número necessário de elementos para atingir a PFP desejada: %d\n", N);

%% B)
alfabeto = 'a':'z';
wordArr1 = GenerateString(m,alfabeto);
wordArr2 = GenerateString(300, alfabeto);
B = BloomInit(N,k);

for i=1:length(wordArr1)
    word = wordArr1{i};
    B = BloomInsert(B,word,k);
end

fp = 0;
for i=1:length(wordArr2)
    word = wordArr2{i};
    if BloomVerify(B,word,k) == 1
        fp = fp +1;
    end
end

fprintf("False Positives %d\n", fp);
fp/300;