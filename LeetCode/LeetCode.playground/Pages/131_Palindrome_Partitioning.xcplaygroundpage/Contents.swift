// https://leetcode.com/problems/palindrome-partitioning/description/?envType=problem-list-v2&envId=string
/*
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.
  
 Example 1:
 Input: s = "aab"
 Output: [["a","a","b"],["aa","b"]]
 
 Example 2:
 Input: s = "a"
 Output: [["a"]]
 */

// https://www.youtube.com/watch?v=aZ0B1eWkSVU&t=978s
func partition(_ s: String) -> [[String]] {
    
    var chars = Array(s)
    var result: [[String]] = []
    
    func isPalindrome(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
 
    func backtrack(_ remaining: String, _ current: [String]) {
        // BASE CASE: No more characters left
        if remaining.isEmpty {
            result.append(current)
            return
        }
        
        // Try all possible prefixes
        for i in 1...remaining.count {
            // Get prefix of length i
            let prefix = String(remaining.prefix(i))
            
            // If prefix is palindrome, try it
            if isPalindrome(prefix) {
                // Get the rest of the string after this prefix
                let suffix = String(remaining.dropFirst(i))
                
                // Recurse with the remaining part
                backtrack(suffix, current + [prefix])
            }
        }
    }
    
    backtrack(s, [])
    
    return result
}

print(partition("aab"))
