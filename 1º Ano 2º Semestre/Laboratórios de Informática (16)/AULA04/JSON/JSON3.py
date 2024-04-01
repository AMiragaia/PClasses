import json

def main():
    with open('data.json', 'r') as f:
        data = json.load(f)
        for i in data:
            print(i)
main()