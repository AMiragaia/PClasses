def allMatches(teams):
   assert len(teams) >= 2, "Requires two or more teams!"
   lista = list()
   for i in teams:
      for p in range(len(teams)):
         if i != teams[p]:
            lista.append((i,teams[p]))
   print(lista)

def main():
    teams = input("Enter the names of the teams: ").split()
    allMatches(teams)

if __name__ == "__main__":
    main()