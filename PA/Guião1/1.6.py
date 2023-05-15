#Desenvolva uma classe Data tendo por atributos dia, mês e ano que lhe permita executar o seguinte
#programa. Pode fazer uso de código que desenvolveu em Introdução à Programação.
class Data:
    def __init__(self, dia, mes, ano):
        self.__dia = dia
        self.__mes = mes
        self.__ano = ano
    def __str__(self):
        return f"{self.__dia}/{self.__mes}/{self.__ano}"
    def __repr__(self):
        return f"Data({self.__dia}, {self.__mes}, {self.__ano})"
    def nextDay(self):
        if self.__dia < Data.monthDays(self.__mes, self.__ano):
            self.__dia += 1
        else:
            self.__dia = 1
            if self.__mes < 12:
                self.__mes += 1
            else:
                self.__mes = 1
                self.__ano += 1
    def monthDays(month, year):
        if month == 2:
            if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0):
                return 29
            else:
                return 28
        elif month in [4, 6, 9, 11]:
            return 30
        else:
            return 31

data1 = Data (28,2,2022)
print(data1)
data1.nextDay()
print (data1)
print(f"Month 2 of 2022 has {Data.monthDays(2, 2022)} days")