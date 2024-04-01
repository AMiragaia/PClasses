lst = [1,2,3,4,5,6,7]
lst2 = [2,3,4,5,6,7]
lst3 = [1,3,4,5,6,7]
lst4 = [1,2,3,5,6,7]
lst5 = [1,2,3,4,5,6,7,8]

med = lambda x: sorted(x)[int(len(x)/2)] if len(x)%2 != 0 else (sorted(x)[int(len(x)/2)]+sorted(x)[(int(len(x)/2))-1])/2
print(med(lst2))