// https://leetcode.com/problems/excel-sheet-column-title/description/
/*
 Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.
 For example:
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  

 Example 1:
 Input: columnNumber = 1
 Output: "A"
 */

func convertToTitle(_ columnNumber: Int) -> String {
    
    var result = ""
    var map = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H", 9: "I", 10: "J", 11: "K", 12: "L", 13: "M", 14: "N", 15: "O", 16: "P", 17: "Q", 18: "R", 19: "S", 20: "T", 21: "U", 22: "V", 23: "W", 24: "X", 25: "Y", 26: "Z"]
    
    var number = columnNumber
    
    while number > 0 {
        number -= 1 // 26
        print(number)
        let reminder = number % 26 // 0
        result += map[reminder + 1] ?? "" //
        number /= 26
    }
    
    return String(result.reversed())
}
convertToTitle(701)

func solution(_ columnNumber: Int) -> String {
    
    var map = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G", 8: "H", 9: "I", 10: "J", 11: "K", 12: "L", 13: "M", 14: "N", 15: "O", 16: "P", 17: "Q", 18: "R", 19: "S", 20: "T", 21: "U", 22: "V", 23: "W", 24: "X", 25: "Y", 26: "Z"]
    
    var num = columnNumber
    var result = ""
    
    while num > 0 {
        num -= 1 // When  num % 26 == 0, code looks up map[0], which is nil, so values like 26,52,702 fail
        let remider = num % 26
        num /= 26
        result = result + (map[remider + 1] ?? "")
    }
    
    return result
}


