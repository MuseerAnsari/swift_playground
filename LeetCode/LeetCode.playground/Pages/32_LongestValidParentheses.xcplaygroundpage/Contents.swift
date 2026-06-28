// https://leetcode.com/problems/longest-valid-parentheses/description/
/*
 Given a string containing just the characters '(' and ')', return the length of the longest valid (well-formed) parentheses substring.

 Example 1:
 Input: s = "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()".
 */

func longestValidParentheses(_ s: String) -> Int {
    
    var stack: [Int] = [-1]
    var maxLength = 0
    
    for (index, char) in s.enumerated() {
        
        if char == "(" {
            stack.append(index)
        } else {
            // Remove last index from stack to keep track diffrences in * 2
            stack.removeLast()
            // if stack in not empty
            if let last = stack.last {
                maxLength = max(maxLength, index - last)
            } else {
                stack.append(index)
            }
        }
    }
    return maxLength
}

longestValidParentheses("))(()   )))((((()))))")


func longestValidParentheses2(_ s: String) -> Int {
    var array = Array(s)
    var maxLength = 0
    // We start with -1 as a base marker for length calculation.
    var stack = [-1]
    
    for i in 0..<array.count {
        // store its index in the stack.
        if array[i] == "(" {
            stack.append(i)
        } else {
            
            // Current character is ')', so try to match it with the last '('.
            stack.removeLast()
            
            // If stack becomes empty, it means this ')' has no matching '('.
            // So we set this index as a new base.
            if stack.isEmpty {
                stack.append(i)
            } else {
                // If stack is not empty, then the top of the stack is the index
                // before the start of the current valid substring.
                // So current valid length = current index - top index in stack.
                let currentLength = i - stack.last!
                maxLength = max(maxLength, currentLength)
            }
        }
    }
    return maxLength
}
