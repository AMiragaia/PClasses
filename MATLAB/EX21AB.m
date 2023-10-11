% Dados
X = 1:6; % Valores possíveis para X
pX = ones(1,6) * 1/6; % Função massa de probabilidade

% Função de distribuição acumulada
FX = cumsum(pX);

% Gráficos
figure;

% (a) Gráfico da função massa de probabilidade
subplot(2,1,1);
stem(X, pX, 'filled');
title('Função Massa de Probabilidade de X');
xlabel('x');
ylabel('p(x)');
xlim([0 7]);
ylim([0 0.2]); % Ajuste aqui para 0.2 para acomodar o valor máximo de p(x)
xticks(1:6);


% (b) Gráfico da função de distribuição acumulada
subplot(2,1,2);
stairs([0 X 7], [0 FX 1], 'LineWidth', 1.5);
title('Função de Distribuição Acumulada de X');
xlabel('x');
ylabel('F(x)');
xlim([0 7]);
ylim([0 1]);
xticks(0:7);
yticks(0:1/6:1);
