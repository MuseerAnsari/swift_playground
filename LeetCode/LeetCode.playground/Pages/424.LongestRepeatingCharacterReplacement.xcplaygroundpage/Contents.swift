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
    var count = [Character: Int]()
    var left = 0
    var maxCount = 0
    var result = 0
    
    
    for right in 0..<chars.count {
        count[chars[right], default: 0] += 1
        maxCount = max(maxCount, count[chars[right]]!)
        print(count)
        // If the window size minus the number of the most frequent char > k,
        // shrink the window
        while (right - left + 1) - maxCount > k {
            count[chars[left]]! -= 1
            left += 1
        }
        result = max(result, right - left + 1)
    }
    
    return result
}

characterReplacement("AABABBA", 1)
