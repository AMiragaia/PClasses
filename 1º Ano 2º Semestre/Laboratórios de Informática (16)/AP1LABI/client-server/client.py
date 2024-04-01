#!/usr/bin/python3

import os
import subprocess
import sys
import socket
import base64
from common_comm import send_dict, recv_dict, sendrecv_dict
from Crypto.Cipher import AES
# os numeros que forem enviados com sucesso para o servidor serão armazenados nesta lista para depois serem contabilizados
numbers = []


# variavel global que serve para armazenar a chave para criptografar ou descriptografar os numeros que sao enviados e recebidos
# caso nao seja usada a criptografia a mesma permanecera com o valor "None"
cipher = None


# funcao que tem como objetivo criptografar os numeros enviados, excepto se o utilizador nao quiser uma segurança extra
def encrypt_intvalue (cipherkey, data):
	cipher = AES.new (cipherkey, AES.MODE_ECB)
	data = cipher.encrypt (bytes("%16d" % (int(data)), "utf8"))
	data_tosend = str (base64.b64encode(data), "utf8")
	return data_tosend


# funcao que tem como objetivo descriptografar os numeros enviados, excepto se o utilizadar nao quiser uma segurança extra
def decrypt_intvalue (cipherkey, data):
	contentor = AES.new (cipherkey, AES.MODE_ECB)
	data = base64.b64decode(data)
	data = contentor.decrypt(data)
	data = int (str (data, "utf8"))
	return data


# funcao que serve para enviar numeros inteiros, criptografados ou nao criptografados
def send_intvalue(client_sock, inteiro):
	req = { "op": "NUMBER", "number": inteiro}
	req = sendrecv_dict(client_sock, req)
	return validate_response(req)

# funcao que serve para validar as respostas enviadas pelo servidor
#client_sock é necessário?!
def validate_response(response):
	if not(response["status"]):
		print(response["error"])
		sys.exit(3)


# funcao que tem como objetivo enviar a operação "QUIT"
def quit_action (client_sock):
	req = {"op": "QUIT"}
	req = sendrecv_dict(client_sock, req)
	validate_response(req)
	if req["status"]:
		print("\nConexão finalizada pelo cliente!")
		sys.exit(4)


# funcao que tem como ojvetivo enviar a operação "STOP"
def stop_action(client_sock):
	req = {"op": "STOP"}
	req = sendrecv_dict(client_sock, req)
	if req["status"]:
		# caso este if detete que os valores recebidos pelo servidore estao criptografados o mesmo enviara
		# para a funcao decrypt_intvalue para os mesmos serem descriptografados
		if not(str(req['min']).lstrip("-").isnumeric() and str(req['max']).lstrip("-").isnumeric):
			miin = decrypt_intvalue(cipher,req['min'])
			maax = decrypt_intvalue(cipher,req['max'])
		# caso nao estejam criptografados os mesmos seram asmazenados diretamente nas variaveis miin e maax
		else:
			miin = req["min"]
			maax = req["max"]
		# prints com o objetivo de exibir os numeros digitados e depois os valores minimos e maximos
		print("Numeros digitados:", end="")
		for x in numbers:
			print("", end=" ")
			print(x, end="")
		print(".")
		print(f"Menor numero digitado: {miin}.")
		print(f"Maior numero digitado: {maax}.")
		sys.exit(0)
	return validate_response(req)

# funcao que tem como objetivo iniciar a operacao "START" porem a mesma da a opçao de o utilizador escolher se quer
# interagir com o servidor de forma criptografada ou nao
def run_client (client_sock, client_id):
	global cipher
	while True:
		# pequeno menu que da a opçao de o utilizador escolher se quer ou nao interagir com o servidor de forma criptografada
		print("\nPretende interagir com o servidor de forma encriptada?")
		print("1- Sim")
		print("2- Não")
		opcao = input("=>")
		# conjunto de ifs e elses que tem como objetivo avaliar os argumentos passados pelo utilizador
		if len(opcao) > 0:
			if opcao == "1":
				print("Comunicação encriptada!")
				cipher = os.urandom(16)
				cipherkey = str (base64.b64encode (cipher), "utf8")
				break
			elif opcao == "2":
				print("Comunicação não encriptada!")
				cipherkey = None
				break
			else:
				print("Opção inválida!")
		else:
			print("O campo não pode estar vazio!")
	request = { "op": "START", "client_id": client_id, "cipher": cipherkey  }
	request = sendrecv_dict(client_sock, request)
	return validate_response(request)

def main():
	global cipher
	# verifica a quantidade de argumentos digitados
	if len(sys.argv) > 4 or len(sys.argv) < 3:
		print("\nQuantidade de arumentos inválida,como usar: python3 client.py 'id do cliente' 'porta' 'IP ou DNS")
		sys.exit(1)
	else:
		#verifica se a porta e inteira e se esta entre 1 e 65535
		if sys.argv[2].isnumeric() and (1 <= float(sys.argv[2]) and float(sys.argv[2]) <= 65535):
			port = int(sys.argv[2])
		else:
			print("A porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!")
			sys.exit(2)
		# verifica se o ip ou dns e valido usando o comando ping mas sem exibir na tela o output
		if len(sys.argv) == 3:
			hostname = "localhost"
		elif subprocess.call(["ping", "-c", "1", sys.argv[3]],stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL) == 0:
			hostname = sys.argv[3]
		else:
			print("Digite um IP ou um DNS válido!")
			sys.exit(3)
			# ou sys.exit(2)??
	client_sock = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
	#tentar conectar ao server com o try para evitar a excessao ConnectionRefusedError
	try:
		client_sock.connect ((hostname, port))
	except ConnectionRefusedError:
		print("Servidor não encontrado!")
		sys.exit(3)
	run_client(client_sock, sys.argv[1])
	while True:
		# menu que da a opção do utilizador escolher entre fechar a conecçao com o servidor ou enviar os numeros inteiros
		print("\nEscolha uma das opções.")
		print("1- Fechar a conecção com o servidor")
		print("2- Enviar valores inteiros")
		opcao = input("=>")
		if len(opcao) > 0:
			if opcao == "1":
				req = quit_action(client_sock)
			elif opcao == "2":
				while True:
					# menu que pergunta quantos valores o utilizador pretende enviar para o servidor
					print("\nDigite quantos numeros pretende enviar.")
					opcao2 = input("=>")
					if opcao2.isnumeric() and len(opcao2) > 0:
						break
					else:
						print("O numero tem de ser positivo e inteiro e o campo não pode ficar em branco!")
				for x in range(0, int(opcao2)):
					while True:
						#menu que ira pedir os numeros inteiros as vezes que o utilizador pediu para depois serem armazenados na lista
						print("\nDigite um numero inteiro.")
						numero = input("=>")
						if numero.lstrip("-").isnumeric() and len(numero) > 0:
							numbers.append(int(numero))
							# caso o utilizador nao tenha escolhido usar criptografia os numeros serao enviados diretamente
							if cipher == None:
								send_intvalue(client_sock, numero)
							# caso o utilizador tenha escolhido usar criptografia os numeros serao primeiro criptografados e depois enviados
							else:
								encript = encrypt_intvalue(cipher, numero)
								send_intvalue(client_sock, encript)
							break
						else:
							print("O numero tem de ser inteiro e o campo não pode ficar em branco!")
				break
			else:
				print("Opção inválida!")
		else:
			print("O campo não pode ficar em branco!")
	while True:
		# ultimo menu que tem como objetivo receber os dados enviados
		print("\nEscolha uma das opções.")
		print("1- Fechar a conecção com o servidor")
		print("2- Finalizar a conecção com o servidor e receber os\nvalores minimos e maximos e a quantidade de valores enviados.")
		opcao = input("=>")
		if len(opcao) > 0:
			if opcao == "1":
				req = quit_action(client_sock)
			elif opcao == "2":
				req = stop_action(client_sock)
				if req == False:
					break
			else:
				print("Opção inválida!")
		else:
			print("O campo não pode ficar em branco!")
	client_sock.close()
	sys.exit(0)

if __name__ == "__main__":
	main()