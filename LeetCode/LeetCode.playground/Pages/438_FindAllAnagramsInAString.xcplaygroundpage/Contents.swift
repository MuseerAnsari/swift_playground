// https://leetcode.com/problems/find-all-anagrams-in-a-string/description/?envType=problem-list-v2&envId=string
/*
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 Example 1:
 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 
 Example 2:
 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

// Time Limit Exceeded
func findAnagrams(_ s: String, _ p: String) -> [Int] {
    
    guard s.count >= p.count else { return [] }
    
    var anagramFreq: [Character: Int] = [:]
    for ch in p {
        anagramFreq[ch, default: 0] += 1
    }
    
    func isValidAnagram(_ s: String) -> Bool {
        var temAnagram: [Character: Int] = [:]
        for ch in s {
            temAnagram[ch, default: 0] += 1
        }
        return anagramFreq == temAnagram
    }
    
    var window: [Character] = []
    var result: [Int] = []
    for (right, ch) in s.enumerated() {
        if window.count >= p.count {
            let windowString = String(window)
            if isValidAnagram(windowString) {
                result.append(right - window.count)
            }
            window.removeFirst()
        }
        window.append(ch)
    }
    
    let windowString = String(window)
    if isValidAnagram(windowString) {
        result.append(s.count - window.count)
    }
    
    return result
}

print(findAnagrams("cbaebabacd", "abc"))

