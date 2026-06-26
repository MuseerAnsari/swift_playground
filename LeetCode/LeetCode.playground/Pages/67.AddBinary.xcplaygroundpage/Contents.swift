// https://leetcode.com/problems/add-binary/description/
/*
 Given two binary strings a and b, return their sum as a binary string.

 Example 1:
 Input: a = "11000", b = "10"
 Output: "100"
 */

func addBinary(_ a: String, _ b: String) -> String {
    
    var binary1 = Array(a)
    var binary2 = Array(b)
    
    let binary1Lenght = binary1.count - 1 // 1
    let binary2Lenght = binary2.count - 1 // 1

    let max = max(binary1Lenght, binary2Lenght)
    var carry = 0
    
    var result: [Character] = []
    
    for i in 0...max {
        var sum = carry
        if i <= binary1Lenght && (binary1[binary1Lenght - i] == "1") { sum += 1 }
        if i <= binary2Lenght && (binary2[binary2Lenght - i] == "1") { sum += 1 }
        result.append(sum % 2 > 0 ? "1" : "0")
        carry = sum / 2
    }
    
    if carry > 0 {
        result.append("1")
    }
    return String(result.reversed())
}

addBinary("10", "10")
