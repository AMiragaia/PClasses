
%I
n_simulacoes = 10000;
n_pecas = 5;
prob_defeito = 0.3;
resultados = zeros(1, n_simulacoes);

for i = 1:n_simulacoes
    pecas = rand(1, n_pecas) <= prob_defeito; % 1 representa defeituoso, 0 representa não defeituoso
    resultados(i) = sum(pecas); % Soma o número de peças defeituosas
end

% Estima a função massa de probabilidade
pX_estimado = histcounts(resultados, 'Normalization', 'probability');


%II
FX_estimado = cumsum(pX_estimado);

% Gráfico da função de distribuição acumulada
figure;
stairs([-1 0:5], [0 FX_estimado 1], 'LineWidth', 1.5);
title('Função de Distribuição Acumulada Estimada de X');
xlabel('x');
ylabel('F(x)');
xlim([-1 6]);
ylim([0 1]);
grid on;

%III
prob_ate_2_defeituosas_estimado = FX_estimado(3);
