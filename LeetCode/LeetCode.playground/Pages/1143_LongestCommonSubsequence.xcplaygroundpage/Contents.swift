// https://leetcode.com/problems/longest-common-subsequence/description/?envType=problem-list-v2&envId=string
/*
 Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.
 A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
 For example, "ace" is a subsequence of "abcde".
 A common subsequence of two strings is a subsequence that is common to both strings.

 Example 1:
 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 */

// https://www.youtube.com/watch?v=e9tUPwZZSBI
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    
    let chars1 = Array(text1)
    let chars2 = Array(text2)
    let m = chars1.count
    let n = chars2.count

    var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    
    for row in 1...m {
        for col in 1...n {
            if chars1[row - 1] == chars2[col - 1] {
                dp[row][col] = dp[row - 1][col - 1] + 1
            }
            else {
                dp[row][col] = max(dp[row - 1][col], dp[row][col - 1])
            }
        }
    }

    return dp[m][n]
}

print(longestCommonSubsequence("aec", "abcde"))
