
from client import *
cipher = None

def test_run_client1 ():
   def run_client1(opcao):
            global cipher
            # conjunto de ifs e elses que tem como objetivo avaliar os argumentos passados pelo utilizador
            if len(opcao) > 0:
               if opcao == "1":
                  print("Comunicação encriptada!")
                  cipher = os.urandom(16)
                  cipherkey = str (base64.b64encode (cipher), "utf8")
                  return cipherkey
               elif opcao == "2":
                  print("Comunicação não encriptada!")
                  cipherkey = None
                  return cipherkey
                  
               else:
                     return("Opção inválida!")
            else:
               return("O campo não pode estar vazio!")
            
   assert(run_client1("1")) != None
   assert(run_client1("2")) == None
   assert(run_client1("")) == "O campo não pode estar vazio!"
   assert(run_client1("3")) == "Opção inválida!"


def test_validate_response():
   response = {"status": True}
   def validate_response(response):
      if not(response["status"]):
         return(response["error"])
         
   assert(validate_response(response)) == None
   response = {"status": False, "error": ["erro,exemplo"]}
   assert(validate_response(response)) == response["error"]



def test_quit_action():
   
   client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
   client_sock.connect(("localhost", 8888))
   def quit_action(client_sock):
      req = {"op": "QUIT"}
      req = sendrecv_dict(client_sock, req)
      req = {"op": "QUIT","status": True}
      if req["status"]:
         return("\nConexão finalizada pelo cliente!")
      
   def quit_action_1(client_sock):
      req = {"op": "QUIT"}
      req = sendrecv_dict(client_sock, req)
      req = {"op": "QUIT","status": False,"error": "erro,exemplo"}
      if req["status"]:
         return("\nConexão finalizada pelo cliente!")
      else:
         return(req["error"])
      

   assert(quit_action(client_sock)) == "\nConexão finalizada pelo cliente!"
   assert(quit_action_1(client_sock)) == "erro,exemplo"

def test_stop_action():
      client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      client_sock.connect(("localhost", 8888))

      def stop_action(client_sock):
            req = {"op": "STOP"}
            req = {"op": "STOP","status": True, 'min': 1, 'max': 3}

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
               return True
      
      assert(stop_action(client_sock)) == True
      
      

   
      


      
