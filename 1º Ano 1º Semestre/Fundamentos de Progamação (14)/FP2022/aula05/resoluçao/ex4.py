def allMatches(equipas):
    for x in equipas:
        for y in equipas:
            if x != y:
                print(x + " - " + y)

def main():
    equipas = ["Benfica", "Sporting", "Porto", "Braga"]
    allMatches(equipas)

if __name__ == "__main__":
    main()