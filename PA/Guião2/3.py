class Produto:
    codigo = 1

    def __init__(self, nome, stock, preco_base):
        self.nome = nome
        self.stock = stock
        self.preco_base = preco_base
        self.id = Produto.codigo
        Produto.codigo += 1

    def get_preco_venda(self):
        pass

    def add_stock(self, quantidade):
        self.stock += quantidade

    def remove_stock(self, quantidade):
        self.stock -= quantidade

    def __str__(self):
        return f"{self.id} {self.nome} {self.stock} {self.preco_base:.2f} {self.get_preco_venda():.2f}"


class Livro(Produto):
    def __init__(self, nome, stock, preco_base, autores=None):
        super().__init__(nome, stock, preco_base)
        if autores is None:
            autores = []
        self.autores = autores

    def add_autor(self, autor):
        if autor not in self.autores:
            self.autores.append(autor)

    def get_autores(self):
        return self.autores

    def get_num_autores(self):
        return len(self.autores)

    def get_preco_venda(self):
        return self.preco_base * 1.06
    
    def get_nome(self):
        return self.nome
    
    def get_stock(self):
        return self.stock
    
    def get_preco_base(self):
        return self.preco_base
    


class Telemovel(Produto):
    def __init__(self, nome, modelo, stock, preco_base):
        super().__init__(f"{nome} {modelo}", stock, preco_base)

    def get_preco_venda(self):
        return self.preco_base * 1.23


class Televisor(Produto):
    def __init__(self, marca, modelo, stock, preco_base, polegadas):
        super().__init__(f"{marca} {modelo}", stock, preco_base)
        self.polegadas = polegadas

    def get_preco_venda(self):
        return self.preco_base * 1.23


class Electrodomestico(Produto):
    def __init__(self, nome, stock, preco_base):
        super().__init__(nome, stock, preco_base)
        self.codigo = f"{self.nome} {self.id}"
        self.classe = None

    def set_classe(self, classe):
        self.classe = classe

    def get_preco_venda(self):
        return self.preco_base * 1.23


def teste():

    livro1 = Livro("Livro 1",100, 15.0) # nome, stock, preço
    livro1.add_autor("Autor 1")
    livro1.add_autor("Autor 2")
    print(f"{livro1.get_nome()} tem {len(livro1.get_autores())} autores");
		
    lista = []
    lista.append("Autor X"); lista.append("Autor Y")
    lista.append("Autor Z")
		
    livro2 = Livro("Livro 2",0,23.0, lista)
    livro2.add_stock(450);
    print(f"{livro2.get_nome()} tem {livro2.get_num_autores()}  autores");

    tlv1 = Televisor("Sony","KX1188",3,1000,56)  # marca, modelo, stock, preco, polegadas

    tlm1 = Telemovel("XWZ","Model A", 10, 560.0 ); # marca, modelo, quantidade, preço

    electr1 = Electrodomestico("Frigorífico", 2, 780);
    electr2 = Electrodomestico("Fogão" , 1, 423);
    electr1.set_classe("A+"); 
		
    #  adicionar a lista com produtos na loja
    lista_produtos = []
    lista_produtos.append(livro1); lista_produtos.append(livro2); 
    lista_produtos.append(electr1); lista_produtos.append(electr2);
    lista_produtos.append(tlm1); lista_produtos.append(tlv1);
	    
    tlm1.add_stock(3);

	# lista todos os produtos, com preços, numa tabela		 		
    print("Lista de Todos os Produtos:");

    for prod in lista_produtos:
        print(prod)


if __name__ == "__main__":
    teste()



