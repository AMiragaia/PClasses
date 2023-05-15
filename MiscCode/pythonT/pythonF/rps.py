move1 = input("RPS?")
move2 = input("RPS?")
if move1 == "R":
    if move2 == "P":
        print("Player2 won")
    elif move2 == "S":
        print("Player1 won")
    else:
        print("Draw")
if move1 == "S":
    if move2 == "R":
        print("Player2 won")
    elif move2 == "P":
        print("Player1 won")
    else:
        print("Draw")
if move1 == "P":
    if move2 == "S":
        print("Player2 won")
    elif move2 == "R":
        print("Player1 won")
    else:
        print("Draw")


