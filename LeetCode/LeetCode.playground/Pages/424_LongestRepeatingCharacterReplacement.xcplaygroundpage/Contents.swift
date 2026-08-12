//https://leetcode.com/problems/longest-repeating-character-replacement/description/?envType=problem-list-v2&envId=hash-table
/*
 You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
 Return the length of the longest substring containing the same letter you can get after performing the above operations.
 
 Input: s = "AABABBA", k = 1
 Output: 4
 Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 There may exists other ways to achieve this answer too.
 
 */

func characterReplacement(_ s: String, _ k: Int) -> Int {
    
    var chars = Array(s)
    var window = [Character: Int]()
    var left = 0
    var maxFrequency = 0
    var maxWindowSize = 0
    
    for right in 0..<chars.count {
        window[chars[right], default: 0] += 1
        maxFrequency = max(maxFrequency, window[chars[right]]!)
        // If the window size minus the number of the most frequent char > k,
        // shrink the window
        let cuurrentWindow = right - left + 1
        let replacementRequired = cuurrentWindow - maxFrequency
        
        if replacementRequired > k {
            let leftChar = chars[left]
            window[leftChar]! -= 1
            left += 1
        }
        
        let  finalValidWindow = right - left + 1
        maxWindowSize = max(maxWindowSize, finalValidWindow)
    }
    
    return maxWindowSize
}

characterReplacement("AABABBA", 1)
