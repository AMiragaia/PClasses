dic = {}

with open("names.txt", "r") as fn:
    fn.readline()
    for l in fn:
        name = l.replace("\n", "").split(" ")
        dic[name[-1]] = dic.get(name[-1], set())
        dic[name[-1]].add(name[0])
        
print(dic)
