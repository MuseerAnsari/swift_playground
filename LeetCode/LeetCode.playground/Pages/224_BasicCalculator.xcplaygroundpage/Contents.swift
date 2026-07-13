// https://leetcode.com/problems/basic-calculator/description/
/*
 Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.
 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

 Example 1:
 Input: s = "1 + 1"
 Output: 2
 */


func calculate(_ s: String) -> Int {
    
    var number = 0
    var partialResult = 0
    var sign = 1
    var stack: [Int] = []
    
    for char in s {
        switch char {
        case "+", "-":
            partialResult += number * sign
            number = 0
            sign = char == "+" ? 1 : -1
        case "(":
            stack.append(partialResult)
            stack.append(sign)
            partialResult = 0
            sign = 1
        case ")":
            partialResult += number * sign
            partialResult *= stack.popLast()!
            partialResult += stack.popLast()!
            number = 0
        case " ":
            break
        default:
            number = number * 10 + char.wholeNumberValue!
        }
    }
    return partialResult + number * sign
    
}
calculate("10 - (1 + 12) - 3")
