import Foundation

// Reverse each word

func reverseWord(_ s: String) -> String {
    
    var chars = Array(s)
    var word = ""
    var result = ""
    for (i, char) in chars.enumerated() {
        if char != " " {
            word += String(char)
        } else {
            result += reverseWord(word)
            result += " "
            word = ""
        }
    }
    result += reverseWord(word)
    
    func reverseWord(_ w: String) -> String {
        var chars = Array(w)
        var left = 0
        var right = chars.count - 1
        while left < right {
            chars.swapAt(left, right)
            left += 1
            right -= 1
        }
        return String(chars)
    }
    
    return result
}

print(reverseWord("Reverse each word"))


