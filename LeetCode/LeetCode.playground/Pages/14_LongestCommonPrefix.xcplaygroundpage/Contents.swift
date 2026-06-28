// https://leetcode.com/problems/longest-common-prefix/
/*
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 */

func solution(_ strs: [String]) -> String {
    
    guard
        let first = strs.first,
            strs.count > 1
    else {
        return strs.first ?? ""
    }
    
    var result = ""
    let finalArray = strs.dropFirst()
    for char in first {
        result += String(char)
        for str in finalArray {
            if !str.hasPrefix(result) {
                result.removeLast()
                return result
            }
        }
    }
    return result
}

solution(["flow","flower","floght"])

func solution2(_ strs: [String]) -> String {
    
    guard
        let first = strs.first,
            strs.count > 1
    else { return strs.first ?? "" }
    
    var result = ""
    var prefix = ""
    for char in first {
        prefix += String(char)
        for str in strs.dropFirst() {
            if !str.hasPrefix(prefix) {
                return result
            }
        }
        result = prefix
    }
    return result
}

solution2(["flow","flower","flight"])
