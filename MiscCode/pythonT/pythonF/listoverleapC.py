import random

a = random.sample(range(1,30), 12)
b = random.sample(range(1,30), 16)
def custom():
    customlist = [x for x in set(a) if x in b]
    result = []
    for i in customlist:
        if i not in result:
            result.append(i)
    print(result)

def main():
    custom()
    
main()