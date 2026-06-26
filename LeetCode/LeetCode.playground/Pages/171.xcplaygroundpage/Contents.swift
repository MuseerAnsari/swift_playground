// https://leetcode.com/problems/excel-sheet-column-number/?envType=problem-list-v2&envId=string
/*
 Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.

 For example:
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 */


func titleToNumber(_ columnTitle: String) -> Int {
        
    let map: [Character: Int] = ["A": 1, "B": 2, "C": 3, "D":4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T":20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    
    var result = 0
    
    for char in columnTitle {
        let value = map[char] ?? 0
        result = (result * 26) + value
    }
    return result
}
