% Dados
X = [5, 50, 100];
pX = [0.9, 0.09, 0.01];
FX = cumsum(pX);

% Gráfico da função de distribuição acumulada
figure;
stairs([0 X], [0 FX], 'LineWidth', 1.5);
title('Função de Distribuição Acumulada de X');
xlabel('x');
ylabel('F(x)');
xlim([0 110]);
ylim([0 1]);
grid on;
