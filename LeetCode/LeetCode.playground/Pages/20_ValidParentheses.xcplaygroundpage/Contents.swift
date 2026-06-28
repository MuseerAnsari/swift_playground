// https://leetcode.com/problems/valid-parentheses/description/
/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 An input string is valid if:
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
 
 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "([]{})"
 Output: true
 */


func solution(_ s: String) -> Bool {
    
    var result = false
    var stack:[Character] = []
    for char in s {
        switch char {
        case "(":
            stack.append(")")
        case "{":
            stack.append("}")
        case "[":
            stack.append("]")
        default:
            // if closing brackets and stack is empty
            // Get last element and remove it from stack
            if stack.isEmpty || stack.popLast() != char {
                return false
            }
        }
    }
    return stack.isEmpty
}

solution("([]{e})")
