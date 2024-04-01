#implemente um servidor TCP utilizando a biblioteca socket do Python


import socket
def main():
    tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp_s.bind( ("127.0.0.1", 1234) )

    tcp_s.listen(1)

    #esperar por novos clientes
    while 1:
        print("Aguardando conexão...")
        conexao, endereco = tcp_s.accept()
        print("Conexão estabelecida com: ", endereco)

        while True:
            #receber dados do cliente quando ele carregar enviar

            dados = conexao.recv(1024)
            if not dados:
                break
            print("Dados recebidos: ", dados.decode())
            conexao.send(dados)
        conexao.close()

    tcp_s.close()


main()