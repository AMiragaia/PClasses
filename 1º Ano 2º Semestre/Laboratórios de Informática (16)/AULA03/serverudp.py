def main():
    import socket
    import sys
    import time

    #cria um socket UDP/IP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    #define o endereço do servidor e porta
    server_address = ('localhost', 1234)
    print('connecting to {} port {}'.format(*server_address))

    #conecta ao servidor
    sock.connect(server_address)

    try:
        #envia uma mensagem
        message = 'Oi, eu sou o cliente'
        print('enviando {}'.format(message))
        sock.sendall(message.encode('utf-8'))

        #recebe a resposta
        amount_received = 0
        amount_expected = len(message)

        while amount_received < amount_expected:
            data = sock.recv(16)
            amount_received += len(data)
            print('recebido {}'.format(data))
        
    finally:
        print('fechando socket')
        sock.close()

