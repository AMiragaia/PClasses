import os
import subprocess
import sys
import socket
import base64
from common_comm import send_dict, recv_dict, sendrecv_dict
from Crypto.Cipher import AES
import tkinter as tk
from tkinter import messagebox

# variaveis global que guardam os botoes do menu principal de forma a estes poderem ser ativados/bloqueados pelas funcoes subsequentes
botaoStart = botaoStop = botaoQuit = botaoNumber = botaoVariosNumbers = None

# os numeros que forem enviados com sucesso para o servidor serão armazenados nesta lista para depois serem contabilizados
numbers = []


# variavel global que serve para armazenar a chave para criptografar ou descriptografar os numeros que sao enviados e recebidos
# caso nao seja usada a criptografia a mesma permanecera com o valor "None"
cipherkey = None

#funcao que tem como objetivo bloquear o utilizador de fechar a janela no "X", obrigando o mesmo a terminar a sessao atraves dos botoes existentes no menu
def disable_event():
    pass

# funcao criada com o objetivo de fechar as janelas
def fecharJanela(janela):
    janela.destroy()

# funcao que serve para validar as respostas enviadas pelo servidor
def validate_response(client_sock,response):
	if not(response["status"]):
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showerror("Erro",response["error"])
		client_sock.close()
		sys.exit(3)
	return True

# funcao que tem como objetivo criptografar os numeros enviados, excepto se o utilizador nao quiser uma segurança extra
def encrypt_intvalue (cipherkey, data):
	cipherkeydecoder = base64.b64decode(cipherkey)
	cipher = AES.new (cipherkeydecoder, AES.MODE_ECB)
	data = cipher.encrypt (bytes("%16d" % (int(data)), "utf8"))
	data_tosend = str (base64.b64encode(data), "utf8")
	return data_tosend

# funcao que tem como objetivo descriptografar os numeros enviados, excepto se o utilizadar nao quiser uma segurança extra
def decrypt_intvalue (cipherkey, data):
	cipherkeydecoder = base64.b64decode(cipherkey)
	contentor = AES.new (cipherkeydecoder, AES.MODE_ECB)
	data = base64.b64decode(data)
	data = contentor.decrypt(data)
	data = int (str (data, "utf8"))
	return data

# funcao que serve para enviar numeros inteiros, criptografados ou nao criptografados
# operaçao NUMBER
def send_intvalue(client_sock, inteiro):
	req = { "op": "NUMBER", "number": inteiro}
	req = sendrecv_dict(client_sock, req)
	return validate_response(client_sock, req)

# funcao que cria uma janela para perguntar ao utilizador quantos numeros pretende enviar para o servidor
def quantosNumeros(client_sock):
    global botaoStop
    global botaoNumber
    global botaoQuit
    global botaoVariosNumbers
    botaoStop["state"] = tk.DISABLED
    botaoQuit["state"] = tk.DISABLED
    botaoNumber["state"] = tk.DISABLED
    botaoVariosNumbers["state"] = tk.DISABLED
    qN = tk.Tk()
    qN.title("Quantos numeros pretende enviar?")
    qN.resizable(width=False,height=False)
    qN.protocol("WM_DELETE_WINDOW", disable_event)
    texto = tk.Label(qN, text="Quantos numeros pretende enviar?", font=5)
    texto.pack()
    valores = tk.Entry(qN, width=40)
    valores.pack()
    botaoProcessar = tk.Button(qN, text="Processar" ,command=lambda:escreverValores(valores.get(), qN, client_sock), state=tk.ACTIVE, width =30,height=1, font=4)
    botaoProcessar.pack()
    qN.mainloop()

# funcao que pede um numero para depois ser enviado para o servidor
def pedirUmNumero(client_sock):
	global cipherkey
	listaDeInputs = list()
	qN = tk.Tk()
	qN.title("Enviar um numero")
	qN.resizable(width=False,height=False)
	qN.protocol("WM_DELETE_WINDOW", disable_event)
	texto1 = tk.Label(qN, text="Digite o valor que pretende enviar.", font=5).pack()
	texto2 = tk.Label(qN, text="Se o valor não for valido o programa pedirá o valor novamente.", font=5).pack()
	caixa = tk.Entry(qN, width =40)
	caixa.pack()
	listaDeInputs.append(caixa)
	botaoProcessar = tk.Button(qN, text="Processar",command=lambda:processarInputs(listaDeInputs, client_sock, qN), state=tk.ACTIVE, width =30,height=1, font=4).pack()
	qN.mainloop()

# funcao que serve para validar os valores digitados na funcao quantosNumeros()
def escreverValores(valores, qN, client_sock):
    if valores.isnumeric():
        if int(valores) <= 0 or 30 < int(valores):
            messagebox.showwarning("Aviso", "Tem de digitar um valor entre um e trinta!")
        else:
            pedirNumeros(int(valores), qN, client_sock)
    else:
        messagebox.showwarning("Aviso", "Tem de digitar um valor inteiro entre um e trinta!")


# funcao que pede os numeros para os mesmos serem enviados para o servidor
def pedirNumeros(quantidade, y, client_sock):
	global cipherkey
	fecharJanela(y)
	listaDeInputs = list()
	qN = tk.Tk()
	qN.title("Enviar numeros")
	qN.resizable(width=False,height=False)
	qN.protocol("WM_DELETE_WINDOW", disable_event)
	texto1 = tk.Label(qN, text="Digite os valores que pretende enviar.", font=5).pack()
	texto2 = tk.Label(qN, text="Os valores que nao forem inteiros não serão enviados.", font=5).pack()
	for x in range(quantidade):
		caixa = tk.Entry(qN, width =40)
		caixa.pack()
		listaDeInputs.append(caixa)
	botaoProcessar = tk.Button(qN, text="Processar",command=lambda:processarInputs(listaDeInputs, client_sock, qN), state=tk.ACTIVE, width =30,height=1, font=4).pack()
	qN.mainloop()

# funcao que pede um numero para ser enviado para o servidor
def processarInput(umInput, client_sock, qN):
	global cipherkey
	global botaoStop
	global botaoNumber
	global botaoQuit
	global botaoVariosNumbers
	contador = False
	if umInput.lstrip("-").isnumeric():
		if not(contador):
			contador = True
			numbers.append(umInput)
		if cipherkey == None:
			send_intvalue(client_sock, umInput)
		else:
			encript = encrypt_intvalue(cipherkey, umInput)
			send_intvalue(client_sock, encript)
		botaoStop["state"] = tk.ACTIVE
		botaoQuit["state"] = tk.ACTIVE
		botaoNumber["state"] = tk.ACTIVE
		botaoVariosNumbers["state"] = tk.ACTIVE
	if contador:
		fecharJanela(qN)
	else:
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showerror("Erro","O valor tem de ser valido!")

# funcao criada para processar os valores da funcao pedirNumeros para apenas os valores inteiros serem enviados para o servidor
def processarInputs(listaDeInputs, client_sock, qN):
	global cipherkey
	global botaoStop
	global botaoNumber
	global botaoQuit
	global botaoVariosNumbers
	contador = False
	for x in listaDeInputs:
		if x.get().lstrip("-").isnumeric():
			if not(contador):
				contador = True
			numbers.append(x.get())
			if cipherkey == None:
				send_intvalue(client_sock, x.get())
			else:
				encript = encrypt_intvalue(cipherkey, x.get())
				send_intvalue(client_sock, encript)
			botaoStop["state"] = tk.ACTIVE
			botaoQuit["state"] = tk.ACTIVE
			botaoNumber["state"] = tk.ACTIVE
			botaoVariosNumbers["state"] = tk.ACTIVE
	if contador:
		fecharJanela(qN)
	else:
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showerror("Erro","Pelo menos tem de haver um valor valido!")


# funcao que mostra o menu principal onde decorrera todas as operaçoes que o utilizador pretende usar para comunicar com o servidor
def menuPrincipal(client_sock, client_id, validador):
    gerar_criptografia(validador)
    global botaoStart
    global botaoStop
    global botaoNumber
    global botaoQuit
    global botaoVariosNumbers
    root = tk.Tk()
    root.resizable(width=False,height=False)
    root.title("Menu do cliente")
    root.protocol("WM_DELETE_WINDOW", disable_event)
    primeiroTexto = tk.Label(root, text="Menu", font=5)
    botaoStart = tk.Button(root, text="Inicar conexão com o servidor",command=lambda: run_client(client_sock, client_id), state=tk.ACTIVE, width =40,height=3, font=4)
    botaoQuit = tk.Button(root, text="Fechar conexão com o servidor", command= lambda:quit_action(client_sock), state=tk.DISABLED, width =40,height=3, font=4)
    botaoNumber = tk.Button(root, text="Enviar um numero para o servidor",command=lambda:pedirUmNumero(client_sock), state=tk.DISABLED, width =40,height=3, font=4)
    botaoVariosNumbers = tk.Button(root, text="Enviar varios numeros para o servidor",command=lambda:quantosNumeros(client_sock), state=tk.DISABLED, width =40,height=3, font=4)
    botaoStop = tk.Button(root, text="Finalizar conexão com o servidor para receber\na quantidade de numeros enviados\no minimo e o maximo.",command=lambda:stop_action(client_sock),state=tk.DISABLED, width =40,height=3, font=4)
    primeiroTexto.pack()
    botaoStart.pack()
    botaoQuit.pack()
    botaoNumber.pack()
    botaoVariosNumbers.pack()
    botaoStop.pack()
    root.mainloop()



# funcao que tem como objetivo enviar a operação "START"
def run_client(client_sock, client_id):
	global botaoVariosNumbers
	global botaoStart
	global botaoNumber
	global botaoQuit
	global cipherkey
	request = { "op": "START", "client_id": client_id, "cipher": cipherkey }
	request = sendrecv_dict(client_sock, request)
	val = validate_response(client_sock,request)
	if val:
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showinfo("Sucesso!","Conectado ao servidor!")
		botaoStart["state"] = tk.DISABLED
		botaoQuit["state"] = tk.ACTIVE
		botaoNumber["state"] = tk.ACTIVE
		botaoVariosNumbers["state"] = tk.ACTIVE

# funcao que tem como objetivo enviar a operação "QUIT"
def quit_action (client_sock):
	req = {"op": "QUIT"}
	req = sendrecv_dict(client_sock, req)
	validate_response(client_sock,req)
	if req["status"]:
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showinfo("","Conexão finalizada pelo cliente!")
		client_sock.close()
		sys.exit(4)

# funcao que tem como objetivo enviar a operação "STOP"
def stop_action(client_sock):
	global cipherkey
	global botaoStop
	global botaoNumber
	global botaoQuit
	req = {"op": "STOP"}
	req = sendrecv_dict(client_sock, req)
	if req["status"]:
		if not(str(req['min']).lstrip("-").isnumeric() and str(req['max']).lstrip("-").isnumeric):
			miin = decrypt_intvalue(cipherkey,req['min'])
			maax = decrypt_intvalue(cipherkey,req['max'])
		else:
			miin = req["min"]
			maax = req["max"]
		botaoStop["state"] = tk.DISABLED
		botaoNumber["state"] = tk.DISABLED
		botaoQuit["state"] = tk.DISABLED
		botaoVariosNumbers["state"] = tk.DISABLED
		numerosEnviados = "Numeros enviados para o servidor: "
		for x in range(len(numbers)):
			numerosEnviados += numbers[x]
			if x == len(numbers) - 1:
				numerosEnviados += "."
			else:
				numerosEnviados += ", "
		numerosEnviados += "\nMinimo: " + str(miin)
		numerosEnviados += "\nMaximo: " + str(maax)
		messagebox.showinfo("Sucesso!", numerosEnviados)
		client_sock.close()
	sys.exit(0)

# funcao que tem como objetivo validar se o utilizador quer ou nao usar criptografia
# caso seja usada a funcao ira gerar uma chave que sera armazenada na variavel global cipherkey
def gerar_criptografia(validador):
	global cipherkey
	if validador:
		cipher = os.urandom(16)
		cipherkey = str(base64.b64encode (cipher), "utf8")
	else:
		cipherkey = None

# funcao que tem como objetivo perguntar ao utilizador se quer ou nao usar criptografia
def criptografia(client_sock, client_id):
    sim = True
    nao = False
    cripto = tk.Tk()
    cripto.resizable(width=False,height=False)
    cripto.title("Criptografia")
    primeiroTexto = tk.Label(cripto, text="Pretende conectar ao servidor de forma criptografada?", font=5)
    primeiroTexto.config(font=5)
    primeiroTexto.pack()
    botaoSim = tk.Button(cripto, text="Sim",command=lambda:[fecharJanela(cripto), menuPrincipal(client_sock, client_id, True)], width=30,height=1, font=4).pack()
    botaoNao = tk.Button(cripto, text="Não",command=lambda:[fecharJanela(cripto), menuPrincipal(client_sock, client_id, False)], width=30,height=1, font=4).pack()
    cripto.mainloop()

# corpo principal do programa
def main():
	# verifica a quantidade de argumentos digitados
	if len(sys.argv) > 4 or len(sys.argv) < 3:
		texto = "Quantidade de argumentos inválida!\nComo usar: python " + sys.argv[0] + " 'id do cliente' 'porta' 'IP ou DNS'"
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showerror("Erro",texto)
		sys.exit(1)
	else:
		#verifica se a porta e inteira e se esta entre 1 e 65535
		if sys.argv[2].isnumeric() and (1 <= float(sys.argv[2]) and float(sys.argv[2]) <= 65535):
			port = int(sys.argv[2])
		else:
			texto = "A porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!"
			mes = tk.Tk()
			mes.withdraw()
			messagebox.showerror("Erro",texto)
			sys.exit(2)
		# verifica se o ip ou dns e valido usando o comando ping mas sem exibir na tela o output
		if len(sys.argv) == 3:
			hostname = "localhost"
		elif subprocess.call(["ping", "-c", "1", sys.argv[3]],stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL) == 0:
			hostname = sys.argv[3]
		else:
			texto = "Digite um IP ou um DNS valido!"
			mes = tk.Tk()
			mes.withdraw()
			messagebox.showerror("Erro",texto)
			sys.exit(3)
			# ou sys.exit(2)??
	client_sock = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
	try:
		client_sock.connect ((hostname, port))
		criptografia(client_sock, sys.argv[1])
		client_sock.close()
	except ConnectionRefusedError:
		texto = "O servidor não está ligado ou a porta foi mal selecionada!"
		mes = tk.Tk()
		mes.withdraw()
		messagebox.showerror("Erro",texto)
		sys.exit(3)
	except KeyboardInterrupt:
		client_sock.close()
		sys.exit(3)
	sys.exit(0)

if __name__ == "__main__":
	main()