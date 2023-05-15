def _sumSq(lst):
    sum = 0
    if len(lst)>0:
        sq0 = lst[0] **2
        previous = sq0 + _sumSq(lst[1:])
        sum = sq0 + previous
    return sum

print(_sumSq([1,2,3,4,5]))