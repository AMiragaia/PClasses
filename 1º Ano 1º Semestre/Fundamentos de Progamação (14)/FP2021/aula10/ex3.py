import os

def printDirFiles(d):
    lst = os.listdir(d)
    for fname in lst:
        path = os.path.join(d, fname)
        if os.path.isfile(path):
            ftype = "FILE"
        elif os.path.isdir(path):
            ftype = "DIR"
        else:
            ftype = "?"
        print(ftype, path)
    return


def findFiles(dirname, ext):
    lst = os.listdir(dirname)
    files = []

    for fname in lst:
        path = os.path.join(dirname, fname)
        # and check the extension
        if os.path.isfile(path) and path.endswith(ext):
            files.append(path)
        elif os.path.isdir(path):
            files.extend(findFiles(path, ext))
    
    return files


def main():
    print("Testing printDirFiles('.'):")
    printDirFiles(".")

    print("\nTesting findFiles('.', '.py'):")
    lst = findFiles(".", ".py")
    print(lst)
    assert isinstance(lst, list)

    print("\nTesting findFiles('..', '.csv'):")
    lst = findFiles("..", ".csv")
    print(lst)

if __name__ == "__main__":
    main()