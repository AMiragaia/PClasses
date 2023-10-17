% Dados fornecidos
prob_erro_Andre = 0.01;
prob_erro_Bruno = 0.05;
prob_erro_Carlos = 0.001;

num_programas_Andre = 20;
num_programas_Bruno = 30;
num_programas_Carlos = 50;

total_programas = num_programas_Andre + num_programas_Bruno + num_programas_Carlos;

% Probabilidades a priori
P_A1 = num_programas_Andre / total_programas;
P_A2 = num_programas_Bruno / total_programas;
P_A3 = num_programas_Carlos / total_programas;

% Probabilidade total de um programa conter um erro
P_B = prob_erro_Andre * P_A1 + prob_erro_Bruno * P_A2 + prob_erro_Carlos * P_A3;

% Probabilidades a posteriori usando o Teorema de Bayes
P_A1_B = (prob_erro_Andre * P_A1) / P_B;
P_A2_B = (prob_erro_Bruno * P_A2) / P_B;
P_A3_B = (prob_erro_Carlos * P_A3) / P_B;

% Exibir os resultados
fprintf('Probabilidade do programa com erro ser do Andre: %f\n', P_A1_B);
fprintf('Probabilidade do programa com erro ser do Bruno: %f\n', P_A2_B);
fprintf('Probabilidade do programa com erro ser do Carlos: %f\n', P_A3_B);

% Determinar de quem é mais provável ser o programa
[~, idx] = max([P_A1_B, P_A2_B, P_A3_B]);
programadores = {'Andre', 'Bruno', 'Carlos'};
fprintf('O programa com erro é mais provável de ser do %s.\n', programadores{idx});
