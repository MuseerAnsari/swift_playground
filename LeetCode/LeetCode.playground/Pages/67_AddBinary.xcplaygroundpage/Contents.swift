// https://leetcode.com/problems/add-binary/description/
/*
 Given two binary strings a and b, return their sum as a binary string.

 Input: a = "11", b = "1"
 Output: "100"
 
 Input: a = "1010", b = "1011"
 Output: "10101"
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

// addBinary("10", "10")


func solution(_ a: String, _ b: String) -> String {
    
    let aChars = Array(a)
    let bChars = Array(b)
    
    var i = aChars.count - 1
    var j = bChars.count - 1
    var carry = 0
    var result = ""
    
    while i >= 0 || j >= 0 || carry > 0 {
        
        var sum = carry
        
        if i >= 0 {
            if aChars[i] == "1" { sum += 1 }
            i -= 1
        }
        
        if j >= 0 {
            if bChars[j] == "1" { sum += 1 }
            j -= 1
        }
        carry = sum / 2
        result = (sum % 2 == 1 ? "1" : "0") + result
    }
    
    return result
}


solution("11", "11")
