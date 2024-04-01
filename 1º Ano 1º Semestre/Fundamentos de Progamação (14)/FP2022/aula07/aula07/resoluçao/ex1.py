import sys 

def main():
    
    with open(sys.argv[1], 'r') as f:
        dict = {}
        for line in f:
            for char in line:
                if char not in dict:
                    dict[char] = 1
                else:
                    dict[char] += 1
        #print the dict by alphabetical order
        for key in sorted(dict):
            print(key, dict[key])

if __name__ == '__main__':
    main()