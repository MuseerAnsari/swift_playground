// https://leetcode.com/problems/longest-palindrome/description/?envType=problem-list-v2&envId=hash-table
/*
 Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
 Letters are case sensitive, for example, "Aa" is not considered a palindrome.

 Example 1:
 Input: s = "abccccdd"
 Output: 7
 Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
 */


func longestPalindrome(_ s: String) -> Int {
    
    let map = s.reduce(into: [Character: Int](), {$0[$1, default: 0] += 1})
    var result = 0
    
    for dic in map {
        let value = dic.value
        result += (value / 2) * 2
    }
    result += result < s.count ? 1 : 0
    return result
}
