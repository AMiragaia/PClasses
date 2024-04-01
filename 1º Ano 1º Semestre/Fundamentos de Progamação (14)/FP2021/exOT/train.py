numtoname = {
        1:"primeira-classe",
        2:"segunda-classe",
        3:"terceira-classe" 
        }
train ={'primeira-classe': (5, [(12345, 'Anabela', 70), (9999, 'Luís', 70)]),
 'segunda-classe': (8, [(52346, 'Rita', 18)]),
 'terceira-classe': (10,
  [(324524534, 'Luís Santos', 70),
   (24456356, 'Luís Bastos', 70),
   (2224524, 'Luís Rodrigues', 70),
   (3256456, 'inês', 20),
   (996775645, 'andré', 22)])}

def comboio_pronto_para_viagem(c_1classe, c_2classe, c_3classe):
    comboio = {
    "primeira-classe": c_1classe ,
    "segunda-classe": c_2classe,
    "terceira-classe": c_3classe
    }
    return comboio


def entrar_no_comboio(comboio, nome, bilhete, idade, classe):
    comboio[numtoname[classe]][1].append((bilhete, nome, idade))

    return comboio
    


def sair_do_comboio(comboio, bilhete):
    for x in comboio.keys():
        for i in comboio[x][1]:
            if i[0] == bilhete:
                comboio[x][1].remove(i)
            else:
                ()
    print(comboio)
    return comboio

#def procurar_passageiro_nome(comboio, nome):
   
