// https://leetcode.com/problems/basic-calculator-ii/description/
/*
 Given a string s which represents an expression, evaluate this expression and return its value.
 The integer division should truncate toward zero.
 You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].
 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().
  

 Example 1:
 Input: s = "3+2*2"
 Output: 7
 */
import Foundation

func calculate(_ s: String) -> Int {
    
    var result = 0
    var previous = 0
    var currentNumber = 0
    var oprator: Character = "+"
    for char in s+"+" where char != " " {
        print(char)
        if char.isNumber {
            currentNumber = currentNumber * 10 + char.wholeNumberValue!
        } else {
            switch oprator {
            case "+":
                result += currentNumber
                previous = currentNumber
            case "-":
                result -= currentNumber
                previous = -currentNumber
            case "*":
                result -= previous
                result += previous * currentNumber
                previous = previous * currentNumber
            default:
                result -= previous
                result += previous / currentNumber
                previous = previous / currentNumber
            }
            currentNumber = 0
            oprator = char
        }
    }
    return result
}
//calculate("3+5*2")

// https://www.youtube.com/watch?v=b_vCkD-rhiU&t=791s

func solution(_ s: String) -> Int {
    
    var prevOprtr: Character = "+"
    var num = 0
    var stack:[Int] = []
    
    // Added "+" to string so that we can iterate up to last digit
    for char in s.replacingOccurrences(of: " ", with: "") + "+" {
        
        if let digit = char.wholeNumberValue {
            num = num * 10 + digit
        } else {
            // will get num if any oprator observe in loop
            switch prevOprtr {
            case "+":
                stack.append(num)
            case "-":
                stack.append(-num)
            case "*":
                stack.append(stack.removeLast() * num)
            case "/":
                stack.append(stack.removeLast() / num)
            default:
                ()
            }
            num = 0
            prevOprtr = char
        }
    }
    
    return stack.reduce(0, +)
}
print(solution("0-2147483647"))
