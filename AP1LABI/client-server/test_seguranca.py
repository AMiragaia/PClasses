
import socket
import base64
import os
from Crypto.Cipher import AES

def test_encrypt_decrypt_intvalue1():
   client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
   client_sock.connect(("localhost", 8888))
   users = {"andre": {"socket": client_sock, "cipher": None, "numbers": [1,2,3]}}
   def run_client (client_sock, client_id):
      global cipher
      
      cipher = os.urandom(16)
      cipherkey = str (base64.b64encode (cipher), "utf8")

      request = { "op": "START", "client_id": client_id, "cipher": cipherkey  }
      return request["cipher"]
   
   def encrypt_intvalue (cipherkey, data):
      cipher = AES.new (cipherkey, AES.MODE_ECB)
      data = cipher.encrypt (bytes("%16d" % (int(data)), "utf8"))
      data_tosend = str (base64.b64encode(data), "utf8")
      return data_tosend

   def decrypt_intvalue (cipherkey, data):
      contentor = AES.new (cipherkey, AES.MODE_ECB)
      data = base64.b64decode(data)
      data = contentor.decrypt(data)
      data = int (str (data, 'utf8'))
      return data
   
   
   assert(encrypt_intvalue(run_client(client_sock,"andre"),1)) != 1
   
