import UIKit

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var strSet = Set<String>()
    
    for row in 0..<board.count {
        for col in 0..<board.count {
            let value = board[row][col]
            if value == "." { continue }
            
            let rowValues = "\(value) found in row \(row)"
            let colValues = "\(value) found in col \(col)"
            let boxValues = "\(value) in box \((row/3)) - \((col/3))"
            
            if strSet.contains(rowValues) || strSet.contains(colValues) || strSet.contains(boxValues){
                return false
            }
            strSet.insert(rowValues)
            strSet.insert(colValues)
            strSet.insert(boxValues)
        }
    }
    return true
}

isValidSudoku([["5","3",".",".","7",".",".",".","."]
               ,["6",".",".","1","9","5",".",".","."]
               ,[".","9","8",".",".",".",".","6","."]
               ,["8",".",".",".","6",".",".",".","3"]
               ,["4",".",".","8",".","3",".",".","1"]
               ,["7",".",".",".","2",".",".",".","6"]
               ,[".","6",".",".",".",".","2","8","."]
               ,[".",".",".","4","1","9",".",".","5"]
               ,[".",".",".",".","8",".",".","7","9"]])
