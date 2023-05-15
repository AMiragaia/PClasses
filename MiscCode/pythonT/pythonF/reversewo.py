def askstring():
    str = input("Diz-me uma str:")
    strsplit = str.split()
    lst = []
    for x in range(len(strsplit)):
        lst.append(strsplit[len(strsplit)-x-1])

    print (lst)
    print(strsplit)
askstring()