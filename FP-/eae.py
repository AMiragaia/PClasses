
def isPalindrome(x):
    revs_number = 0
    y=x
    while y > 0:
        revs_number = (revs_number * 10) + (y % 10)
        y = y // 10
    print(revs_number)
    print(x)
    if x == revs_number:
        print("True")
    else:
        print("FLS")

isPalindrome(12321)