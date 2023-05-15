#Write a Python function solve_sudoku(board) that, given an incomplete Sudoku matrix in board, completes the matrix.
#Then, you must complete all values equal to zero, and return the completed board.
#The board is a 9x9 matrix, and each cell is either a number or an empty cell.
#The numbers in each cell can be from 1 to 9.
#The cells with the numbers 1 to 9 should be filled with the numbers 1 to 9.
#The cells with the number 0 should be left empty.
#The cells with the number -1 should be filled with the numbers 1 to 9.
#The function should return the completed board.

def solve_sudoku(board):
    def is_valid(board, row, col, num):
        for i in range(9):
            if board[row][i] == num:
                return False
        for i in range(9):
            if board[i][col] == num:
                return False
        row_start = (row // 3) * 3
        col_start = (col // 3) * 3
        for i in range(row_start, row_start + 3):
            for j in range(col_start, col_start + 3):
                if board[i][j] == num:
                    return False
        return True
    for i in range(9):
        for j in range(9):
            if board[i][j] == 0:
                for k in range(1, 10):
                    if is_valid(board, i, j, k):
                        board[i][j] = k
                        solve_sudoku(board)
                return board
    return board

