import pytest
import sys
from subprocess import Popen, PIPE

p = Popen ("python3 server.py 8888", stdout=PIPE, shell=True)


def test_server_no_args ():
    proc = Popen ("python3 server.py", stdout=PIPE, shell=True)
    assert proc.wait() == 1
    assert proc.stdout.read ().decode ('utf-8') == ("\nQuantidade de argumentos inválida, uso: python3 server.py [porta]\n")

def test_server_invalid_port ():
	proc = Popen ("python3 server.py -1", stdout=PIPE, shell=True)
	assert proc.wait() == 2
	assert proc.stdout.read ().decode ('utf-8') == ("\nA porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!\n")

def test_server_invalid_port_2 ():
	proc = Popen ("python3 server.py 65536", stdout=PIPE, shell=True)
	assert proc.wait() == 2
	assert proc.stdout.read ().decode ('utf-8') == ("\nA porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!\n")

def test_client_no_args ():
	proc = Popen ("python3 client.py", stdout=PIPE, shell=True)
	assert proc.wait() == 1
	assert proc.stdout.read ().decode ('utf-8') == ("\nQuantidade de arumentos inválida,como usar: python3 client.py 'id do cliente' 'porta' 'IP ou DNS\n")

def test__client_invalid_id ():
	proc = Popen ("python3 client.py andre -1 localhost", stdout=PIPE, shell=True)
	assert proc.wait() == 2
	assert proc.stdout.read ().decode ('utf-8') == ("A porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!\n")

def test_client_invalid_port_2 ():
	proc = Popen ("python3 client.py andre 0 localhost", stdout=PIPE, shell=True)
	assert proc.wait() == 2
	assert proc.stdout.read ().decode ('utf-8') == ("A porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!\n")

def test_client_invalid_port_3 ():
	proc = Popen ("python3 client.py andre 65536 localhost", stdout=PIPE, shell=True)
	assert proc.wait() == 2
	assert proc.stdout.read ().decode ('utf-8') == ("A porta digitada tem de ser um valor inteiro e tem de estar entre [1,65535]!\n")

def test_client_menu():
	proc = Popen ("python3 client.py andre 8888 localhost", stdout=PIPE, shell=True)
	assert proc.wait() == 1
	assert proc.stdout.read ().decode ('utf-8') == ("\nPretende interagir com o servidor de forma encriptada?\n1- Sim\n2- Não\n=>")
	
def test_client_menu_2():
	proc = Popen ("python3 client.py andre 8888 xx", stdout=PIPE, shell=True)
	assert proc.wait() == 3
	assert proc.stdout.read ().decode ('utf-8') == ("Digite um IP ou um DNS válido!\n")

