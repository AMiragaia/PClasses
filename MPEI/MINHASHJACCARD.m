clear all

frase1 = 'Lisboa é Porto são duas cidades importantes de Portugal.';
frase2 = 'Lisboa é a capital de Portugal.'; 
frase3 = 'Porto é a capital do Norte de Portugal.'; 
frase4 = 'Portugal não é só Lisboa e Porto.';

fraseCell = {frase1, frase2,frase3,frase4};
Nu = 4;
k = 4;
shinglesize = 3;
%shingles e a divisao da frase

FraseMinHash = zeros(Nu, k);

for FraseN=1:Nu
    Frase = fraseCell{1,FraseN};
    for hashFuncN=1:k
        %iterar sobre os shingles todos
        hashArr=zeros(1,strlength(Frase)-shinglesize+1);
        for ShingleN=1:strlength(Frase)-shinglesize+1
            %armazenar o shingle em key
            key = char(Frase(ShingleN:(ShingleN+shinglesize-1)));
            %fazer o hash do shingle
            hashArr(ShingleN) = hf1(key,hashFuncN)+1;
        end
        FraseMinHash(FraseN,hashFuncN) = min(hashArr);
    end
end
Distance = zeros(4,4);
%calcular a dist 1 1,1 2, 1 3 , 1 4, 2 2 ,2 3, 2 4, 3 4
for n1=1:length(FraseMinHash)
    for n2=n1:length(FraseMinHash)
        %is match retorna o numero de valores de hash iguais
        isMatch = FraseMinHash(n1,:)==FraseMinHash(n2,:);
        %formula para calcular a distancia de jaccard, 
        Distance(n1,n2) = 1-sum(isMatch)/length(isMatch);
    end
end
   %Shingling: Converta o documento (ou string) em um conjunto de shingles. No seu código, isso é feito pegando subsequências contínuas de caracteres de tamanho shinglesize.

   %Hashing: Aplique uma função de hash a cada shingle para obter um valor numérico. No seu código, isso é feito dentro do loop for ShingleN usando a função hf1.

   %Formação da Assinatura MinHash: Para cada documento e para cada função de hash, armazene o menor valor de hash obtido de todos os shingles desse documento. No seu código, isso é feito ao encontrar o mínimo valor em hashArr para cada função de hash e armazená-lo na matriz FraseMinHash.

   %Comparação de Assinaturas: Para estimar a similaridade entre dois documentos, compare suas assinaturas MinHash. No seu código, isso é feito calculando a distância como 1 - (número de valores de hash correspondentes / número total de funções de hash).