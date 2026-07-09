import Foundation
// https://leetcode.com/problems/reverse-words-in-a-string/description/
/*
 Given an input string s, reverse the order of the words.
 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
 Return a string of the words in reverse order concatenated by a single space.
 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
  
 Example 1:
 Input: s = "the sky is blue"
 Output: "blue is sky the"
 */

func reverseWords(_ s: String) -> String {
    let string = s.split(separator: " ")
        .reversed()
        .joined(separator: " ")
    return string
}
// reverseWords(" the sky is blue ")

func solution(_ s: String) -> String {
    
    var word = ""
    var wordAray: [String] = []
    let str = s.trimmingCharacters(in: .whitespacesAndNewlines)
    for char in str {
        if char != " " {
            word += String(char)
        } else if char == " " {
            wordAray.append(word)
            word = ""
        }
    }
    wordAray.append(word)
    
    var reversedWordArray: [String] = []
    var count = wordAray.count - 1
    
    for word in wordAray {
        reversedWordArray.append(wordAray[count])
        count -= 1
    }
    
    var result = ""
    for word in reversedWordArray {
        if word == "" { continue }
        result += (word + " ")
    }
    result = result.trimmingCharacters(in: .whitespacesAndNewlines)
    
    return result
}
