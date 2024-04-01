#!/usr/bin/python3

from sqlite3 import Row
import sys
import socket
import select
import json
import base64
import csv
import random
from unittest import result
from common_comm import send_dict, recv_dict, sendrecv_dict
import os
from Crypto.Cipher import AES

# Dicionário com a informação relativa aos clientes
users = {}


def find_client_id (client_sock):
	# nesta funcao nos extraimos sucessivamente as keys (k) e os values (v) presentes nos users
	# depois guardamos na variavel (a) o valor de cada "socket" extraido e compararamos com o recebido (client_socket)
	# se o if encontrar o socket que queremos ele ira dar return da nossa key, ou seja, o id que queremos
	# caso nao encontre a funcao ira dar return do valor None
	for k,v in users.items():
		a = v["socket"]
		if client_sock == a:
			return k
	return None


# funcao para criptografar os valores caso o utilizador pretenda interagir de forma criptografada
def encrypt_intvalue (cipher, data):
	cipherkey = base64.b64decode(cipher)
	contentor = AES.new (cipherkey, AES.MODE_ECB)
	data = contentor.encrypt(bytes("%16d" % (int(data)), "utf8"))
	data_tosend = str (base64.b64encode(data), "utf8")
	return data_tosend


# Função para descriptografar os valores caso o utilizador pretenda interagir de forma criptografada
def decrypt_intvalue (cipher, data):
	cipherkey = base64.b64decode(cipher)
	contentor = AES.new (cipherkey, AES.MODE_ECB)
	data = base64.b64decode(data)
	data = contentor.decrypt(data)
	data = int (str (data, "utf8"))
	return data


# funcao que serve para processar as mensagens recebidas pelo utilizador
# a função vai receber o client sock e vai atribuir o dict á variável request
#depois vai verificar a operação que o utilizador pretende fazer, chamando a função relacionada com a mesma
#no caso de não existir a operação vai dar um erro
def new_msg (client_sock):
	request = recv_dict(client_sock)
	if request['op'] == 'START':
		return new_client(client_sock, request)
	elif request['op'] == 'QUIT':
		return quit_client(client_sock, request)
	elif request['op'] == 'NUMBER':
		return number_client(client_sock, request)
	elif request['op'] == 'STOP':
		return stop_client(client_sock, request)
	else:
		print('Operação inválida!')

#funcao que tem como objetivo criar um utilizador novo, caso o mesmo ainda não esteja registado
#vai atribuir á variavel response um dicionario com a operação "START" (pedida pelo utilizador)
#vai verificar se o utilizador já está registado, caso não esteja vai criar um novo utilizador
#caso esteja vai dar um erro
def new_client (client_sock, request):
	response = {"op": "START"}
	if request["client_id"] not in users.keys():
		users[request["client_id"]] = {"socket": client_sock, "cipher": request["cipher"], "numbers": []}
		response['status'] = True
	else:
		response["status"] = False
		response['error'] = "Cliente existente"
	send_dict(client_sock, response)
	create_file()


def clean_client (client_sock):
	#funcao para elimnar o cliente da lista de users
	client_id = find_client_id(client_sock)
	removedor = users.pop(client_id, None)
	return removedor

# funcao que tem como objetivo processar a operecao "QUIT"
#vai procurar o cliente na lista de users e vai eliminar o mesmo, se existir
#caso nao exista vai dar um erro
def quit_client (client_sock, request):
	client_id = find_client_id(client_sock)
	removedor = users.pop(client_id, None)
	if removedor != None:
		request["status"] = True
	else:
		request["status"] = False
		request["error"] =  "Cliente inexistente"
	send_dict(client_sock, request)

# funcao para criar o arquivo report.csv, caso ele ja exista o mesmo não sera gerado
def create_file ():
	if not os.path.isfile('report.csv'):
		with open('report.csv', 'w') as csvfile:
			csvfile.write('client_id ,numeros_recebidos, numero_minimo, numero_maximo\n')


#funcao que serve para atualizar o report.csv 
#vai procurar os valores necessarios para atualizar o report.csv e desincriptar os mesmos se necessario
#verifica se a existencia de uma cifra, agindo de acordo com o caso
def update_file (client_id, result):
	if users[client_id]["cipher"] == None:
		with open('report.csv', 'a', encoding='UTF8', newline='') as f:
			data = [client_id, len(users[client_id]["numbers"]), min(users[client_id]["numbers"]), max(users[client_id]["numbers"])]
			writer = csv.writer(f)
			writer.writerow(data)
	else:
		with open('report.csv', 'a', encoding='UTF8', newline='') as f:
			data = [client_id, len(users[client_id]["numbers"]), decrypt_intvalue(users[client_id]["cipher"], result["min"]), decrypt_intvalue(users[client_id]["cipher"], result["max"])]
			writer = csv.writer(f)
			writer.writerow(data)

# funcao que tem como intuito processar a operacao "NUMBER", caso a mesma nao receba valores inteiros esta nao ira armazenar os valores
def number_client (client_sock, request):
		client_id = find_client_id(client_sock)
		if client_id != None:
			for k,v in users.items():
				if k == client_id:
					if v["cipher"] == None:
						v["numbers"].append(int(request["number"]))
					else:
						number = decrypt_intvalue(v["cipher"], request["number"])
						v["numbers"].append(int(number))
					users[k] = v
			request["status"] = True
		else:
			request["status"] = False
			request["error"] =  "Cliente inexistente"
		send_dict(client_sock, request)
		result = request
		return result

# funcao que processa a operacao "STOP"
#esta função vai verificar se o cliente existe e está registado, processando os numeros recebidos e atualizando o report.csv
#a função tem em conta a quantidade de numeros recebidos e o numero minimo e maximo, caso o cliente nao tenha recebido nenhum numero vai dar um erro
#caso o cliente tenha recebido numeros vai desincriptar os mesmos se necessario, e atualizar os valores do request do mesmo de acordo com a situação

def stop_client (client_sock, request):
	client_id = find_client_id(client_sock)
	if client_id != None:
		for k,v in users.items():
			if k == client_id:
				if len(v["numbers"]) < 1:
					request["status"] = False
					request["error"] = "Dados insuficientes"
				else:
					if v["cipher"] == None:
						miin = min(v["numbers"])
						maax = max(v["numbers"])
						request["status"] = True
						request["min"] = miin
						request["max"] = maax
					else:
						miin = min(v["numbers"])
						maax = max(v["numbers"])
						request["min"] = encrypt_intvalue(v["cipher"],miin)
						request["max"] = encrypt_intvalue(v["cipher"],maax)
						request["status"] = True
					
					result = request
					update_file(client_id, result)

	else:
		request["status"] = False
		request["error"] = "Cliente inexistente"
	send_dict(client_sock, request)

def main():
	# verifica a quantidade de argumentos digitados
	if len(sys.argv) != 2:
		print("\nQuantidade de argumentos inválida, uso: python3 server.py [porta]")
		
		sys.exit(1)
	else:
		#verifica se a porta e inteira e se esta entre 1 e 65535
		if sys.argv[1].isnumeric() and (1 <= float(sys.argv[1]) and float(sys.argv[1]) <= 65535):
			port = int(sys.argv[1])
		else:
			print("\nA porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!")
			sys.exit(2)
	server_socket = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
	server_socket.bind (("127.0.0.1", port))
	print("\nServidor iniciado na porta: " + str(port))
	server_socket.listen (10)
	clients = []
	create_file ()
	while True:
		try:
			available = select.select ([server_socket] + clients, [], [])[0]
		except ValueError:
			# Sockets may have been closed, check for that
			for client_sock in clients:
				if client_sock.fileno () == -1: client_sock.remove (client) # closed
			continue # Reiterate select

		for client_sock in available:
			# New client?
			if client_sock is server_socket:
				newclient, addr = server_socket.accept ()
				clients.append (newclient)
			# Or an existing client
			else:
				# See if client sent a message
				if len (client_sock.recv (1, socket.MSG_PEEK)) != 0:
					# client socket has a message
					#print ("server" + str (client_sock))
					new_msg (client_sock)
				else: # Or just disconnected
					clients.remove (client_sock)
					clean_client (client_sock)
					client_sock.close ()
					break # Reiterate select

if __name__ == "__main__":
	main()