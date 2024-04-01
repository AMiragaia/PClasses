
from psutil import users
from requests import request
from server import create_file, find_client_id, new_client, clean_client, quit_client, number_client, stop_client, update_file
import pytest
import socket
import os
import base64
from Crypto.Cipher import AES
#função que verifica se existe o ficheiro criado é o report.csv
def test_create_file():
	create_file()
	assert os.path.isfile("report.csv") == True
	with open('report.csv', 'r') as f:
		lines = f.readlines()
		assert len(lines) == 1
		assert lines[0] == "client_id ,numeros_recebidos, numero_minimo, numero_maximo\n"
		print("Teste do ficheiro create report.csv: OK")


def test_find_client_id():
	users = {"andre": {"socket": socket.socket(socket.AF_INET, socket.SOCK_STREAM), "cipher": "", "numbers": []}}
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client_sock.connect(('localhost', 8888))
	client_id = find_client_id(client_sock)
	for k,v in users.items():
		if k == client_id:
			assert v["socket"] == client_sock
			print("Teste da função find_client_id: OK")
			

def test_new_client():
	users = {}
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client_sock.connect(('localhost', 8888))
	request = {"op" : "START","client_id": "andre","cipher": None}
	def new_client (client_sock, request):

		response = {"op": "START","status":True}
		if request["client_id"] not in users.keys():
			users[request["client_id"]] = {"socket": client_sock, "cipher": request["cipher"], "numbers": []}
			response['status'] = True
		else:
			response["status"] = False
			response['error'] = "Cliente existente"
		
		return response
		
	new_client(client_sock,request)	
	assert users[request["client_id"]] == {"socket": client_sock, "cipher": None, "numbers": []} 
		
def test_clean_client():
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client_sock.connect(('localhost', 8888))
	users = {"andre": {"socket": client_sock, "cipher": None, "numbers": [1,2]}}
	def find_client_id(client_sock):
		for k,v in users.items():
			if v["socket"] == client_sock:
				return k
	    
	def clean_client (client_sock):
		#funcao para elimnar o cliente da lista de users
		client_id = find_client_id(client_sock)
		removedor = users.pop(client_id, None)
		return removedor

	clean_client(client_sock)
	assert client_sock not in users
	

def test_quit_client():
	users = {"andre": {"socket": socket.socket(socket.AF_INET, socket.SOCK_STREAM), "cipher": "", "numbers": []}}
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client_sock.connect(('localhost', 8888))
	request = {"op": "QUIT"}
	def quit_client (client_sock, request):
		client_id = find_client_id(client_sock)
		removedor = users.pop(client_id, None)
		if removedor != None:
			request["status"] = True
		else:
			request["status"] = False
			request["error"] =  "Cliente inexistente"
		return request
	quit_client(client_sock,request)
	assert client_sock not in users
	

def test_number_client():
	users = {}
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client_sock.connect(('localhost', 8888))

	def decrypt_intvalue (cipher, data):
		cipherkey = base64.b64decode(cipher)
		contentor = AES.new (cipherkey, AES.MODE_ECB)
		data = base64.b64decode(data)
		data = contentor.decrypt(data)
		data = int (str (data, "utf8"))
		return data
	
	def number_client (client_sock, request):
		users = {"andre": {"socket": client_sock, "cipher": "", "numbers": []}}
		client_id = ["andre"]
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
		result = request
		return users
	
	number_client(client_sock,{"op": "NUMBER", "number": 1})
	number_client(client_sock,{"op": "NUMBER", "number": 2})
	for k,v in users.items():
		if k == "andre":
			assert v["numbers"] == [1,2]
			

def test_stop_client():
	users = {}
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client_sock.connect(('localhost', 8888))

	def encrypt_intvalue (cipherkey, data):
		cipher = AES.new (cipherkey, AES.MODE_ECB)
		data = cipher.encrypt (bytes("%16d" % (int(data)), "utf8"))
		data_tosend = str (base64.b64encode(data), "utf8")
		return data_tosend

	def stop_client (client_sock, request):
		users = {"andre": {"socket": client_sock, "cipher": None, "numbers": [1,2,3]}}
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
						

	for k,v in users.items():
		if k == "andre":
			assert v["min"] == 1
			assert v["max"] == 2
			

	
def test_update_file():
	users = {}
	client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

	  
			
	def decrypt_intvalue (cipher, data):
			cipherkey = base64.b64decode(cipher)
			contentor = AES.new (cipherkey, AES.MODE_ECB)
			data = base64.b64decode(data)
			data = contentor.decrypt(data)
			data = int (str (data, "utf8"))
			return data
	def number_client (client_sock, request):
				users = {"andre": {"socket": client_sock, "cipher": "", "numbers": []}}
				client_id = ["andre"]
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
				result = request
				return users
	for k in users.keys():
		if k == "andre":
			update_file(k,number_client(client_sock,request))
			with open('report.csv', 'r') as f:
				lines = f.readlines()
				assert len(lines) == 2
				assert lines[1] == "andre ,2, 1, 2\n"






	
