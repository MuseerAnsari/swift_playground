import Foundation

// https://leetcode.com/problems/word-break/description/
/*
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
 Note that the same word in the dictionary may be reused multiple times in the segmentation.

 Example 1:
 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 */


func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    
    let wordSet = Set(wordDict)
    let n = s.count
    var dp = [Bool](repeating: false, count: n + 1)
    dp[0] = true
    let chars = Array(s)
    for i in 1...n {
        for j in 0..<i {
            print(chars[j..<i])
            if dp[j] && wordSet.contains(String(chars[j..<i])) {
                dp[i] = true
                break
            }
        }
    }
    return dp[n]
}
// wordBreak("bb", ["a","b","bbb","bbbb"])

// ********** Not passed in leecode compiler *****************
func wordBreak2(_ s: String, _ wordDict: [String]) -> Bool {
    guard
        !s.isEmpty,
        !wordDict.isEmpty
    else { return false}
    
    var inputStr = s
    var wordSet = Set(wordDict)
    var count = wordSet.count
    
    for word in wordSet {
        guard inputStr.contains(word) else { return false }
        inputStr = inputStr.replacingOccurrences(of: word, with: "")
        wordSet.remove(word)
        count -= 1
        if count == 0 {
            return true
        }
    }
    return false
}
// wordBreak2("bb", ["a","b","bbb","bbbb"])
