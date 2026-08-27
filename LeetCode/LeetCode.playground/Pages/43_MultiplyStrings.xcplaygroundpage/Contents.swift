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
    let arrayNums2 = Array(num2).compactMap({Int(String($0))}).reversed()
    let m = arrayNums1.count
    let n = arrayNums2.count
    
    var result = 0
    
    for (index, num) in arrayNums2.enumerated() {
        let array = mulplyArray(arrayNums1, m: num)
        if index > 0 {
            var sum = getArraySum(array)
            for _ in 1...index {
                sum *= 10
            }
            result += sum
        } else {
            result += getArraySum(array)
        }
    }
    
    func getArraySum(_ a: [Int]) -> Int {
        var sum = 0
        let array = Array(a.reversed())
        for i in 0..<array.count {
            let num = array[i]
            sum = sum * 10 + num
        }
        return sum
    }
    
    
    func mulplyArray(_ a: [Int], m: Int) -> [Int] {
        
        var array: [Int] = []
        var carry = 0
        
        for num in a.reversed() {
            let multiplication = (num * m) + carry
            let digit = multiplication % 10
            carry = multiplication / 10
            array.append(digit)
        }
        
        return array
    }
    
    return String(result)
}
print(multiply("123", "456"))
