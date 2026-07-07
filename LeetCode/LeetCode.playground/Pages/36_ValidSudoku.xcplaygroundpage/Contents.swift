// https://leetcode.com/problems/valid-sudoku/description/
/*
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
 
 
 Example 1:
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var set: Set<String> = []
    for i in 0..<board.count {
        for j in 0..<board.count {
            let currVal = board[i][j]
            if currVal == "." {
                continue
            }
            let row = "\(currVal) found in row \(i)"
            let col = "\(currVal) found in col \(j)"
            let box = "\(currVal) found in box \((i/3)) - \((j/3))"
            // check duplicate digit in row
            if set.contains(row) {
                return false
            } else {
                set.insert(row)
            }
            // check duplicate digit in column
            if set.contains(col) {
                return false
            } else {
                set.insert(col)
            }
            // check duplicate digit in box
            if set.contains(box) {
                return false
            } else {
                set.insert(box)
            }
        }
    }
    return true
}

isValidSudoku([ ["5","3",".", ".","7",".", ".",".","."]
               ,["6",".",".", "1","9","5", ".",".","."]
               ,[".","9","8", ".",".",".", ".","6","."]
                
               ,["8",".",".",".","6",".",".",".","3"]
               ,["4",".",".","8",".","3",".",".","1"]
               ,["7",".",".",".","2",".",".",".","6"]
                
               ,[".","6",".",".",".",".","2","8","."]
               ,[".",".",".","4","1","9",".",".","5"]
               ,[".",".",".",".","8",".",".","7","9"] ])

