
import pandas as pd
import matplotlib.pyplot as plt
def main():
    Como a taxa de desemprego em Portugal mudou desde o início da pandemia de COVID-19?

    Quais setores da economia foram mais afetados pelo desemprego durante a pandemia?

    Como a distribuição do emprego por regiões em Portugal mudou durante a pandemia?

    Qual foi a variação percentual no número de pessoas empregadas em Portugal durante a pandemia?

    Como a pandemia afetou a taxa de emprego entre diferentes grupos etários em Portugal?

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
