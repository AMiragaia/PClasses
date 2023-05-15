import random
def get_random_list():
    l = list(random.sample(range(50),random.randint(0,25)))
    return l

def first_and_last(l):
    new = [l[0],l[-1]]
    return new
def main():
    x = first_and_last(get_random_list())
    print(x)
main()