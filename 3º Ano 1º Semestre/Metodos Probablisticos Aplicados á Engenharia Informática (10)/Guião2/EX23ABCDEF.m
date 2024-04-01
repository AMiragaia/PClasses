% Alinea A
n_simulacoes = 10000;
resultados = zeros(1, n_simulacoes);

for i = 1:n_simulacoes
    lancamentos = randi([0, 1], 1, 4); % 0 representa cara e 1 representa coroa
    resultados(i) = sum(lancamentos); % Soma o número de coroas
end

% Estima a função massa de probabilidade
pX_estimado = histcounts(resultados, 'Normalization', 'probability');


%Alinea B
valor_esperado_estimado = sum(0:4 * pX_estimado);
variancia_estimada = sum((0:4 - valor_esperado_estimado).^2 .* pX_estimado);
desvio_padrao_estimado = sqrt(variancia_estimada);


%Alinea D
n = 4;
p = 0.5;
pX_teorico = binopdf(0:4, n, p);

%Alinea E
valor_esperado_teorico = n * p;
variancia_teorica = n * p * (1-p);

%Alinea F
prob_pelo_menos_2_coroas = sum(binopdf(2:4, n, p));
prob_ate_1_coroa = sum(binopdf(0:1, n, p));
prob_entre_1_e_3_coroas = sum(binopdf(1:3, n, p));

