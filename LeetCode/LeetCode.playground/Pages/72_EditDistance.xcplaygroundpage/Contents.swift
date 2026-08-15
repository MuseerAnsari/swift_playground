// https://leetcode.com/problems/edit-distance/description/
/*
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.
 You have the following three operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
 
 Example 1:
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 */

// https://www.youtube.com/watch?v=HwDXH35lr0o
func minDistance(_ word1: String, _ word2: String) -> Int {
    
    let rows = word1.count + 1 // row
    let cols = word2.count + 1 // col
    let chars1 = Array(word1)
    let chars2 = Array(word2)
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    
    // fill first row
    for i in 0..<cols {
        dp[0][i] = i
    }
    // fill first col
    for i in 0..<rows {
        dp[i][0] = i
    }
    
    for row in 1..<rows {
        for col in 1..<cols {
            // if both characters are same replace with top left
            if chars1[row - 1] == chars2[col - 1] {
                dp[row][col] = dp[row - 1][col - 1]
            } else {
                let topLeft = dp[row - 1][col - 1]
                let top = dp[row - 1][col]
                let left = dp[row][col - 1]
                let minimumOperationCount = min(topLeft, min(top, left))
                dp[row][col] = minimumOperationCount + 1
            }
        }
    }
    
    return dp[rows - 1][cols - 1]
}

print(minDistance("horse", "ros"))
