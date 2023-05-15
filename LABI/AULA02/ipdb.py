import sys
def main(argv):
    num = int(argv[1])
    for x in range( num//2 ):
        if num % x != 0:
            print("False")
        print("True")
main(sys.argv)
#código com erros para teste
