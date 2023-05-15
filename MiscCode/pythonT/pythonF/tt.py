#Write a Python text-based game that, depending on the users' choices, branches into different scenarios.
#The only oddity, on developing a text-based game dynamic, will be how the user answers the questions. If a particular answer is given, the user will be branched to a separate section.
#The game should have a main menu, where the user can choose to play the game, or quit.
#All the questions have only 3 options (A,B,C,a,b,c), except for ones that you need to pick up something with a yes or no answer (Y,N,y,n).
def dungeonsandragons():
    print("""
    Welcome to Dungeons and Dragons!
    Please choose an option:
    1. Play Game
    2. Quit
    """)
    while True:
        try:
            choice = int(input("Choice: "))
        except ValueError:
            print("Please enter a number.")
            continue
        if choice == 1:
            print("""
            You are a wandering adventurer in a land of dragons.
            You have been given a choice between two paths to take:
            1. Go to the swamp, where you can find a dragon.
            2. Go to the mountains, where you can find a dragon.
            """)
            while True:
                try:
                    choice = int(input("Choice: "))
                except ValueError:
                    print("Please enter a number.")
                    continue
                if choice == 1:
                    print("""
                    You have chosen the swamp.
                    You have been given a choice between two paths:
                    1. Go left
                    2. Go right
                    """)
                    while True:
                        try:
                            choice = int(input("Choice: "))
                        except ValueError:
                            print("Please enter a number.")
                            continue
                        if choice == 1:
                            print("""
                            You have chosen the left path.
                            You have been given a choice between two paths:
                            1. Go up
                            2. Go down
                            """)
                            while True:
                                try:
                                    choice = int(input("Choice: "))
                                except ValueError:
                                    print("Please enter a number.")
                                    continue
                                if choice == 1:
                                    print("""
                                    You have chosen the up path.
                                    You have been given a choice between two paths:
                                    1. Go left
                                    2. Go right
                                    """)
                                    while True:
                                        try:
                                            choice = int(input("Choice: "))
                                        except ValueError:
                                            print("Please enter a number.")
                                            continue
                                        if choice == 1:
                                            print("""
                                            You have chosen the left path.
                                            You have been given a choice between two paths:
                                            1. Go up
                                            2. Go down
                                            """)
                                            
                                                
                                                