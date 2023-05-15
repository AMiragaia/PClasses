# isLeapYear(year) deve devolver True se year é um ano bissexto
# e False se é um ano comum.  Corrija-a.
# (See: https://en.wikipedia.org/wiki/Leap_year)
def isLeapYear(year):
    if (year % 4 == 0 and year % 100 != 0) or year % 400 == 0:
    #para além de ter de ser divisivel por 4 o ano não pode ser divisivel por 100
    #porém estes anos que são centenários se forem divisiveis por 400 são considerados bissextos
        return True
    else:
        return False


# monthDays deve devolver o número de dias de um dado mês num dado ano.
# Por exemplo, monthDays(2004, 2) deve devolver 29.
# Corrija-a.
def monthDays(year, month):
    MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    #o unico mês que altera os dias de acordo com o ano ser bissexto é fevereiro
    #Por isso podemos ir buscar os valores diretamente ao MONTHDAYS, exceto se for um ano bissexto e o mês for 2
    if isLeapYear(year) and month == 2:
       return 29
    else:
         return MONTHDAYS[month]


# nextDay deve devolver o dia a seguir a uma dada data.
# Por exemplo, nextDay(2017, 1, 31) deve devolver (2017, 2, 1)
def nextDay(year, month, day):
    if day < monthDays(year, month):
        return year, month, day + 1
    #caso o dia indicado seja menor que o dia que a função Monthdays retorna, podemos simplemsnte retornar a data +1 dia
    else:
        #o mesmo se pode fazer para os meses visto que cada ano tem sempre os mesmos meses, e todos começam no dia 1
        if month < 12:
            return year, month + 1, 1
        #caso o mês seja 12 e o numero de dias 31, vamos adicionar 1 ano, e deixar o mes e o dia em 1
        else:
            return year + 1, 1, 1



# Defina uma função dateIsValid que deve
# devolver True se os seus argumentos formarem uma data válida
# e devolver False no caso contrário.
# Por exemplo, dateIsValid(1980, 2, 29) deve devolver True,
# dateIsValid(1980, 2, 30) deve devolver False.
def dateIsValid(year, month, day):
   #condições para uma data ser valida, não ser negativa, os meses não serem maiores  que 12
   #Os dias têm de estar de acordo com o mês, dado o return da função MonthDays
    if year > 0 and month > 0 and month < 13 and day > 0 and day <= monthDays(year, month):
        return True
    else:
        return False


# Defina uma função previousDay que devolva o dia anterior a uma dada data.
# Por exemplo, previousDay(1980, 3, 1) deve devolver (1980, 2, 29)
def previousDay(year, month, day):
   #basicamente a função nexday, ao contrario
    if day > 1:
        return year, month, day - 1
    else:
        if month > 1:
            return year, month - 1, monthDays(year, month - 1)
        else:
            return year - 1, 12, 31


# No Codecheck, não chame nenhuma função: o sistema trata disso