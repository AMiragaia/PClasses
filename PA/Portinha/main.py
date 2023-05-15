
import pandas as pd
import matplotlib.pyplot as plt
def main():
    #Questão 1
    #Como variam as vendas mediante certas regiões?


    #Questão 2
    #Como tem variado as receitas ao longo dos anos?


    #Questão 3
    #Que empresa tem revelado o maior crescimento relativamente às outras?





    #Questão Extra
    #Comparação com despesas de marketing
    
    
    
    
    
    
    
    
    
    #Gráfico Geral
    # Carregue os dados do arquivo xlsx
    file_path = 'nike-adidas-puma-sales.xlsx'
    data = pd.read_excel(file_path, engine='openpyxl', header=None)

    data.columns = ['Ano','Vendas Nike', 'Vendas Adidas', 'Vendas Puma']
    # Defina 'Ano' como índice
    data.set_index('Ano', inplace=True)

    # Crie um gráfico de linha para visualizar as vendas anuais da Nike, Adidas e Puma
    ax = data.plot.line(figsize=(12, 6))
    ax.set_ylabel("Vendas(Bilhões de Doláres)")
    ax.set_title("Vendas Anuais - Nike, Adidas e Puma")

    # Salve o gráfico em um arquivo
    plt.savefig('vendas_anuais.png', bbox_inches='tight')
    plt.show()

#main()
