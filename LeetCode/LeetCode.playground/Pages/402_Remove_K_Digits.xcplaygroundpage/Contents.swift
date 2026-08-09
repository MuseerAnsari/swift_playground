// https://leetcode.com/problems/remove-k-digits/description/?envType=problem-list-v2&envId=string
/*
 Given string num representing a non-negative integer num, and an integer k, return the smallest possible integer after removing k digits from num.

 Example 1:
 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 
 Example 2:
 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 
 Example 3:
 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
 */
import Foundation

func removeKdigits(_ num: String, _ k: Int) -> String {
    
    guard k > 0 else { return num }
    guard k < num.count else { return "0" }
        
    var nums = Array(num)
    var stack: [Character] = []
    var removals = k
    
    for digit in nums {
        
        while removals > 0, let last = stack.last, last > digit {
            stack.popLast()
            removals -= 1
        }
        stack.append(digit)
    }
    
    // If the number is non-decreasing, remove digits from the end.
    if removals > 0 {
        stack.removeLast(removals)
    }
    
    // Remove leading zeros
    while stack.count > 0,
            let first = stack.first,
            first == "0" {
        stack.removeFirst()
    }
    
    if stack.isEmpty {
        return "0"
    }
 
    return String(stack)
}


print(removeKdigits("1432219", 3))
