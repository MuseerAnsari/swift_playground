// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
/*
 Given a string s, find the length of the longest substring without duplicate characters.
 Example 1:
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var chars: [Character] = []
    var subRange = 0
    for char in s {
        if let index = chars.firstIndex(of: char) {
            chars.removeSubrange(0...index)
        }
        chars.append(char)
        subRange = max(chars.count, subRange)
    }
    return subRange
}
// lengthOfLongestSubstring("abcabcbb")

func longestSubstringSoloution2(_ s: String) -> String {
  
    var subString = ""
    var result = ""
    for char in s {
        if subString.contains(where: {$0 == char}) {
            if subString.count > result.count {
                result = subString
            }
            subString = ""
        }
        subString.append(String(char))
    }
    return result
}
// longestSubstringSoloution2("pwwkew")

// https://www.youtube.com/watch?v=U2ppEzBaMck&t=807s
func longestSubstringSlidingWindow(_ s: String) -> String {
    
    var chars = Array(s)
    var left = 0
    var seen: [Character: Int] = [:] // char -> last index
    var maxLength = 0
    var maxStart = 0
    
    for (right, char) in chars.enumerated() {
        // If char was seen inside the current window, shrink from left
        if let prev = seen[char], prev >= left {
            left = prev + 1
        }
        
        let currentLengh = right - left + 1
        // Update max length and max start
        if currentLengh > maxLength {
            maxStart = left
            maxLength = currentLengh
        }
        // Record current position of ch
        seen[char] = right
    }
    
    let subArray = chars[maxStart..<(maxStart + maxLength)]
    return String(subArray)
}
print(longestSubstringSlidingWindow("pwwkew"))
