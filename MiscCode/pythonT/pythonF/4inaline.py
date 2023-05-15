
#These lines can be (i) horizontal, (ii) vertical or (iii) diagonal in both directions.
#Write a Python function four_in_line(board) that given a matrix called board of varying size, returns a set with the two extrema points: the coordinates where the winner line starts and ends. 
#The board matrix contains either 0 (empty), 1 (red) or 2 (yellow). Return an empty set if there is no winner. At most, one winner exists.
#The function should return a set with the two extrema points.
#     
def four_in_line(board):
    for i in range(len(board)):
        for j in range(len(board[i])):
            if board[i][j] == 0:
                continue
            elif board[i][j] == 1:
                if i > 0 and board[i-1][j] == 1:
                    if i > 1 and board[i-2][j] == 1:
                        if i > 2 and board[i-3][j] == 1:
                            return {(i,j), (i-3,j)}
                    elif i < len(board)-3 and board[i+1][j] == 1:
                        if i < len(board)-2 and board[i+2][j] == 1:
                            if i < len(board)-1 and board[i+3][j] == 1:
                                return {(i,j), (i+3,j)}
                if j > 0 and board[i][j-1] == 1:
                    if j > 1 and board[i][j-2] == 1:
                        if j > 2 and board[i][j-3] == 1:
                            return {(i,j), (i,j-3)}
                    elif j < len(board[i])-3 and board[i][j+1] == 1:
                        if j < len(board[i])-2 and board[i][j+2] == 1:
                            if j < len(board[i])-1 and board[i][j+3] == 1:
                                return {(i,j), (i,j+3)}
            elif board[i][j] == 2:
                if i > 0 and board[i-1][j] == 2:
                    if i > 1 and board[i-2][j] == 2:
                        if i > 2 and board[i-3][j] == 2:
                            return {(i,j), (i-3,j)}
                    elif i < len(board)-3 and board[i+1][j] == 2:
                        if i < len(board)-2 and board[i+2][j] == 2:
                            if i < len(board)-1 and board[i+3][j] == 2:
                                return {(i,j), (i+3,j)}
                if j > 0 and board[i][j-1] == 2:
                    if j > 1 and board[i][j-2] == 2:
                        if j > 2 and board[i][j-3] == 2:
                            return {(i,j), (i,j-3)}
                    elif j < len(board[i])-3 and board[i][j+1] == 2:
                        if j < len(board[i])-2 and board[i][j+2] == 2:
                            if j < len(board[i])-1 and board[i][j+3] == 2:
                                return {(i,j), (i,j+3)}                            
    return set()

                


    