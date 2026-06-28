
import Foundation

// 23
func letterCombinations(_ digits: String) -> [String] {
    
    // Dictionary mapping digits to their corresponding letters on phone keypad
    let phoneMap: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]
    
    guard !digits.isEmpty else { return [] }
    
    let chars = Array(digits)
    var result: [String] = []
    
    func backTrace(_ index: Int, _ path: inout String) {
        if index == chars.count {
            result.append(path)
            return
        }
        
        let digit = chars[index]
        guard let letters = phoneMap[digit] else { return }
        
        for char in letters {
            path.append(char)
            backTrace(index + 1, &path)
            path.removeLast()
        }
    }
    var current = ""
    backTrace(0, &current)
    return result
}
