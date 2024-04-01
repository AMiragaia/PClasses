
import os
def file_size_dir(path):
    #retorna o tamnho de cada ficheiro no diretorio
    for file in os.listdir(path):
        tamanho = os.stat(os.path.join(path, file)).st_size
        print(f'{file} - {tamanho} bytes')

def main():
    path = input('Path: ')
    file_size_dir(path)
if __name__ == '__main__':
    main()