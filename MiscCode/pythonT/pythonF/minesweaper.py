import random
#Create a function that takes a grid of # and -, where each hash (#) represents a mine and each dash (-) represents a mine-free spot. Return a list where each dash is replaced by a digit indicating the number of mines immediately adjacent to the spot (horizontally, vertically, and diagonally).
def minesweaper(grid):
    mines = []
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == '-':
                mines.append((i,j))
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == '-':
                count = 0
                for k in range(-1,2):
                    for l in range(-1,2):
                        if (i+k,j+l) in mines:
                            count += 1
                grid[i][j] = str(count)
    print (grid)
    return grid
def MinesweaperGame():  
    grid = [['#', '#', '#', '#', '#'],
            ['#', '-', '-', '-', '#'],
            ['#', '-', '-', '-', '#'],
            ['#', '-', '-', '-', '#'],
            ['#', '#', '#', '#', '#']]
    mines = []
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == '-':
                mines.append((i,j))
    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == '-':
                count = 0
                for k in range(-1,2):
                    for l in range(-1,2):
                        if (i+k,j+l) in mines:
                            count += 1
                grid[i][j] = str(count)
    print (grid)
    return grid

MinesweaperGame()

