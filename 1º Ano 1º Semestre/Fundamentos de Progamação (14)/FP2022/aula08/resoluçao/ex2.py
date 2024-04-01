def main():
    f = open("UA/FP-/FP2022/aula08/resoluçao/names.txt", "r")
    names = f.readlines()
    f.close()
    dict = {}
    for i in range(1, len(names)):
        #build a dict the last name as key and all the first names with that last name as value
        if names[i].split()[-1] in dict:
            dict[names[i].split()[-1]].append(names[i].split()[0])
        else:
            dict[names[i].split()[-1]] = [names[i].split()[0]]
    print(dict)

        
        





main()
if __name__ == "__main__":
    main()