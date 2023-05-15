def right_justify(x):
    newstr = (70-len(x))*" " + x
    print(newstr)
right_justify("monty")