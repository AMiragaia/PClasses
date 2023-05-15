
def main():
    file1 = input('File 1: ')
    file2 = input('File 2: ')
    if compareFiles(file1, file2):
        print('Files are equal')
    else:
        print('Files are different')