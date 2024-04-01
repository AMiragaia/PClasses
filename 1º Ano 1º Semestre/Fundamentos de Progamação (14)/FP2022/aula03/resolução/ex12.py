def countdown(N):
    if N == 0:
        print('POW!')
    else:
        print(N)
        countdown(N-1)

def main():
    countdown(5)

main()