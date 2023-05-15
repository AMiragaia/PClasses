class Alojamento:
    def __init__(self, codigo, nome, local, preco, disponibilidade, avaliacao):
        self.__codigo = codigo
        self.__nome = nome
        self.__local = local
        self.__preco = preco
        self.__disponibilidade = disponibilidade
        self.__avaliacao = avaliacao

    def get_codigo(self):
        return self.__codigo

    def set_codigo(self, codigo):
        self.__codigo = codigo

    def get_nome(self):
        return self.__nome

    def set_nome(self, nome):
        self.__nome = nome

    def get_local(self):
        return self.__local

    def set_local(self, local):
        self.__local = local

    def get_preco(self):
        return self.__preco

    def set_preco(self, preco):
        self.__preco = preco

    def get_disponibilidade(self):
        return self.__disponibilidade

    def set_disponibilidade(self, disponibilidade):
        self.__disponibilidade = disponibilidade

    def get_avaliacao(self):
        return self.__avaliacao

    def set_avaliacao(self, avaliacao):
        self.__avaliacao = avaliacao

    def check_in(self):
        self.__disponibilidade = False

    def check_out(self):
        self.__disponibilidade = True


class Apartamento(Alojamento):
    def __init__(self, codigo, nome, local, preco, disponibilidade, avaliacao, num_quartos):
        super().__init__(codigo, nome, local, preco, disponibilidade, avaliacao)
        self.__num_quartos = num_quartos

    def get_num_quartos(self):
        return self.__num_quartos

    def set_num_quartos(self, num_quartos):
        self.__num_quartos = num_quartos


class QuartoHotel(Alojamento):
    def __init__(self, codigo, nome, local, preco, disponibilidade, avaliacao, tipo):
        super().__init__(codigo, nome, local, preco, disponibilidade, avaliacao)
        self.__tipo = tipo

    def get_tipo(self):
        return self.__tipo

    def set_tipo(self, tipo):
        self.__tipo = tipo


apartamento1 = Apartamento("APT001", "Apartamento 1", "Lisboa", 50.0, True, 4.5, 2)
quarto1 = QuartoHotel("QH001", "Quarto 1", "Porto", 30.0, True, 3.0, "single")

print(apartamento1.get_codigo())  # saída: APT001
print(quarto1.get_codigo())  # saída: QH001

apartamento1.check_in()
print(apartamento1.get_disponibilidade())  # saída: False

quarto1.set_preco(35.0)
print(quarto1.get_preco())  # saída: 35.0
