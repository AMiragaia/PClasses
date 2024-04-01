%seguem o procedimento de inicializar -> Adicionar -> Verificar
%%a
m = 300;  % Número de bits no filtro de Bloom
k = 1;    % Número de funções hash
pfp = 0.03; % Probabilidade de falso positivo desejada
N = 1;    % Valor inicial para o número de elementos
%verifica se a probablidade de teste e menor que a pratica, se for adiciona
%um a lista de elementos
%itera sobre o loop ate achar o valor correto
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
%adiciona
for i=1:length(wordArr1)
    word = wordArr1{i};
    B = BloomInsert(B,word,k);
end
%compara e incrementa fp
fp = 0;
for i=1:length(wordArr2)
    word = wordArr2{i};
    if BloomVerify(B,word,k) == 1
        fp = fp +1;
    end
end
%divide fp pelo numero de tentativas
fprintf("False Positives %d\n", fp);
fp/300;


%%exemplos de adicionar elemento
% 4a)
function value = IsMember(BF,chave,k)
    value = true;  % Inicializar o output a true (pertence)
    % Fazer a hash e calculo das posicoes tal e qual como se fosse para
    % adicionar o valor
    h= 127;
    chave= double(chave);
    nBF= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        if (BF(mod(h,nBF)+1) == 0)  % Se uma das posicoes tiver o valor 0 entao este elemento nao pertence ao BF
            value = false;  % Output a false (não pertence)
            break;
        end
    end
end

% Funcoes dadas pelos professores
function BF= Init(n)
    BF= zeros(n,1);
end

function BF= AddElement(BF,chave,k)
    h= 127;
    chave= double(chave);
    nBF= length(BF);
    for i= 1:length(chave)
        h= mod(31*h+chave(i),2^32-1);
    end
    for i= k:-1:1
        h= mod(31*h+i,2^32-1);
        BF(mod(h,nBF)+1)= 1;
    end
end