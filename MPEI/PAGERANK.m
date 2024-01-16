%Resolver dead ends
%Sao links que nao levam a lado nenhum, redistribuir na matriz por todas as
%paginas incluindo ele mesmo

%fazer uma matriz com as probabilidades de saltar para qualquer pagina de
%forma aleatoria
%sendo N o tamanho da matriz dos hyperlinks
N = length(matrizresolvida);
sobreN = ones(N)/N;%Fazer matriz NxN de 1/N
%resolver dead ends A(isnan(A)) = 1/N
%Calcular A
A = p * H + (1-p)* sobreN
 
%ranks e inicializado com valores iguais para todas as paginas
%reflete igual probablidade de começar em qualquer pagina
%e um vetor coluna de dimensao N com valores 1/N sendo N o tamanho da
%matriz H
ranks = ones(N, 1)*1/N;

%Calculo do pagerank, calcular matriz A e  e A^10*ranks
ranks = A^10*ranks;
%da uma matriz coluna com os valores do page rank