//https://leetcode.com/problems/first-unique-character-in-a-string/description/?envType=problem-list-v2&envId=hash-table
/*
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
 
 Example 1:
 Input: s = "leetcode"
 Output: 0
 Explanation:
 The character 'l' at index 0 is the first character that does not occur at any other index.
 */


func firstUniqChar(_ s: String) -> Int {
    
    var map: [Character: Int] = [:]
    
    for char in s {
        map[char, default: 0] += 1
    }
    
    for (index, char) in s.enumerated() {
        if let count = map[char],
           count == 1 {
            return index
        }
    }
    return -1
}

func firstUniqChar2(_ s: String) -> Int {

    let map = s.reduce(into: [Character: Int](), {$0[$1, default: 0] += 1})
    for (index, char) in s.enumerated() {
        if let count = map[char],
           count == 1 {
            return index
        }
    }
    return -1
}
