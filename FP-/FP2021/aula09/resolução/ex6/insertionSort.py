
# This function sorts a list (like list.sort)
# using the insertion sort algorithm.
# Modify it to accept a key= keyword argument that works like in list.sort.

from pickle import NONE


def insertionSort(lst, key=None):
    i = 1
    if key != None:
        list1 = sorted(lst, key=key)
        for i in range(len(list1)): 
            lst[i] = list1[i]  # i = index of element to insert next = end of sorted part
    else:
        while i < len(lst):
            x = lst[i]    # x is the element to insert
        # insert x into lst[:i]
            k = i-1
            while k >= 0 and lst[k] > x:
                lst[k+1] = lst[k]
                k -= 1
            lst[k+1] = x
            i += 1



def main():
    # Original list
    lst0 = ["paulo", "augusto", "maria", "paula", "bernardo", "tito"]
    print("lst0", lst0)

    # sort in lexicographic order:
    lst = lst0.copy()
    insertionSort(lst)
    print("lst1", lst)
    assert lst == sorted(lst0)

    # sort by length (requires key= argument):
    lst = lst0.copy()
    insertionSort(lst, key=len)
    print("lst2", lst)
    assert lst == sorted(lst0, key=len)

    # sort by length, than lexicographic order:
    myorder = lambda s:(len(s), s)
    lst = lst0.copy()
    insertionSort(lst, key=myorder)
    print("lst3", lst)
    assert lst == sorted(lst0, key=myorder)

    print("All tests OK!")

if __name__ == "__main__":
    main()

