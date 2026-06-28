// https://leetcode.com/problems/generate-parentheses/description/
/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 */
// Video solution
// https://youtu.be/s9fokUqJ76A

func generateParatheses(_ n: Int) -> [String] {
    
    guard n > 0 else { return [] }
    guard n > 1 else { return ["()"] }
    
    var result: [String] = []
    // open = number of open paranthesis
    // close = number of close paranthesis
    // Valid if open == close == n
    // Only add open prantheses if open < n
    // Only add close paranthese if close < open
    
    func backTrace(open: Int, close: Int, s: String) {
        if close == n {
            result.append(s)
        }
        if open < n {
            backTrace(open: open + 1, close: close, s: s + "(")
        }
        if close < open {
            backTrace(open: open, close: close + 1, s: s + ")")
        }
    }
    backTrace(open: 1, close: 0, s: "(")
    return result
}

print(generateParatheses(3))
