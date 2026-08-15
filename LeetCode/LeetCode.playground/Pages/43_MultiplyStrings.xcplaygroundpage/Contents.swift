// https://leetcode.com/problems/multiply-strings/description/?envType=problem-list-v2&envId=string
/*
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
 Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

 Example 1:
 Input: num1 = "2", num2 = "3"
 Output: "6"
 
 Example 2:
 Input: num1 = "123", num2 = "456"
 Output: "56088"
 */


func multiply(_ num1: String, _ num2: String) -> String {
    
    let arrayNums1 = Array(num1).compactMap({Int(String($0))})
    let arrayNums2 = Array(num2).compactMap({Int(String($0))})
    let m = arrayNums1.count
    let n = arrayNums2.count
    
    var (muliplyTimes, j) = (0, 0)
    var result = 0
    while muliplyTimes < arrayNums2.count {
        var temResult = 0
        for num in stride(from: m, to: 0, by: -1) {
            let numberToBeMuliplied = arrayNums2[n - muliplyTimes]
            
        }
        muliplyTimes += 1
    }
    
    
    
    
    return ""
}

print(multiply("123", "456"))
