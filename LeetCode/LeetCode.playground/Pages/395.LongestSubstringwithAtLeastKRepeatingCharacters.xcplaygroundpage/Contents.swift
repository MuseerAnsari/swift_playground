//https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/description/?envType=problem-list-v2&envId=hash-table
/*
 Given a string s and an integer k, return the length of the longest substring of s
 such that the frequency of each character in this substring is greater than or equal to k.
 if no such substring exists, return 0.
 
 Example 1:
 Input: s = "ababbc", k = 2
 Output: 5
 Explanation: The longest substring is "ababb", as 'a' is repeated 2 times and 'b' is repeated 3 times.
 */



func longestSubstring(_ s: String, _ k: Int) -> Int {
 
    guard k > 0 else { return s.count }
    guard !s.isEmpty else { return 0 }

    var unique: [Character: Int] = [:]
    for char in s {
        unique[char, default: 0] += 1
    }
    var index = s.startIndex
    while index < s.endIndex, let count = unique[s[index]], count >= k {
        index = s.index(after: index)
    }
    
    if index == s.endIndex {
        return s.count
    }
    
    let left = longestSubstring(String(s[s.startIndex..<index]), k)
    
    var nextIndex = s.index(after: index)
    while nextIndex < s.endIndex, let count = unique[s[nextIndex]], count < k {
        nextIndex = s.index(after: nextIndex)
    }
    
    let right = longestSubstring(String(s[nextIndex..<s.endIndex]), k)
    return max(left, right)
}

// print(longestSubstring("bbaaacbd", 3))


func longestSubstring2(_ s: String, _ k: Int) -> Int {
    let maxUnique = Set(s).count
    guard k > 0 else { return s.count }
    guard !s.isEmpty else { return 0 }
    guard maxUnique > 1 else { return s.count >= k ? s.count : 0 }
    
    
    let chars: [Character] = Array(s)
    var maxLength = 0
    
    for currUnique in 1...maxUnique {
        var frequencies: [Character: Int] = [:]
        var left = 0, right = 0, uniqueCount = 0, countAtLeastK = 0
        while right < s.count {
            // expand the sliding window
            if uniqueCount <= currUnique {
                let char = chars[right]
                let freq = frequencies[char, default: 0] + 1
                if freq == 1 { uniqueCount += 1 }
                if freq == k { countAtLeastK += 1 }
                frequencies[char] = freq
                right += 1
            }
            // shrink the sliding window
            else {
                let char = chars[left]
                let freq = frequencies[char]! - 1
                if freq == k-1 { countAtLeastK -= 1 }
                if freq == 0 { uniqueCount -= 1 }
                frequencies[char] = freq
                left += 1
            }
            if uniqueCount == currUnique && uniqueCount == countAtLeastK {
                maxLength = max(maxLength, right - left)
            }
        }
    }
    
    
    
    
    
    
    
    
    return maxLength
}

print(longestSubstring2("bbaaacbd", 3))

