// https://leetcode.com/problems/add-strings/description/
/*
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string. You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

 Example 1:
 Input: num1 = "11", num2 = "123"
 Output: "134"
 
 Example 2:
 Input: num1 = "456", num2 = "77"
 Output: "533"
 
 Example 3:
 Input: num1 = "0", num2 = "0"
 Output: "0"
 */

func addStrings(_ num1: String, _ num2: String) -> String {
    
    let numsA = Array(num1)
    let numsB = Array(num2)
    
    var (i, j) = (numsA.count - 1, numsB.count - 1)
    var carry = 0
    var result = ""
    
    while i >= 0 || j >= 0 ||  carry > 0 {
        var numA = 0
        var numB = 0
        
        if i >= 0 {
            numA = Int(String(numsA[i])) ?? 0
        }
        if j >= 0 {
            numB = Int(String(numsB[j])) ?? 0
        }
        let sum = numA + numB + carry
        let digit = sum % 10
        carry = sum / 10
        result = "\(digit)" + result
        i -= 1
        j -= 1
    }
    
    return result
}




func addStrings2(_ num1: String, _ num2: String) -> String {
    
    let numA = Int(num1) ?? 0
    let numB = Int(num2) ?? 0
    let sum = numA + numB
    
    return "\(sum)"
}
