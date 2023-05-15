#Write a function maximum_depth(l) that receives a list l, which can contain other lists, and returns what is the maximum depth in that list.
#The depth corresponds to the number of sub-lists: [] has depth=1, [[]] has depth=2, [[[]]] has depth=3.
def maximum_depth(l):
    if isinstance(l,list)==False:
        return 0
    else:
        max_depth=1
        for i in l:
            depth=maximum_depth(i)+1
            if depth>max_depth:
                max_depth=depth
        return max_depth
        