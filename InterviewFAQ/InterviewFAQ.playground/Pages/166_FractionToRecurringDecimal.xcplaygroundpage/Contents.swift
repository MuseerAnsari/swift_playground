
/*
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 If the fractional part is repeating, enclose the repeating part in parentheses
 If multiple answers are possible, return any of them.
 It is guaranteed that the length of the answer string is less than 104 for all the given inputs.
 Note that if the fraction can be represented as a finite length string, you must return it.

 Example 1:
 Input: numerator = 1, denominator = 2
 Output: "0.5"
 
 Example 2:
 Input: numerator = 2, denominator = 1
 Output: "2"
 
 Example 3:
 Input: numerator = 4, denominator = 333
 Output: "0.(012)"
 */

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    
    guard denominator > 0 else { return "0" }
    
    var result = ""
    // Determine Sign
    if (numerator < 0) != (denominator < 0) {
        result.append("-")
    }
    
    // Work with absolute
    var num = abs(numerator)
    let den = abs(denominator)
    
    // Integer part
    let integer = num / den
    result.append(String(integer))
    
    // No fraction part
    num = num % den
    if num == 0 {
        return result
    }
    
    // Fraction part
    result.append(".")
    
    //              //value: index
    var reminderIndex: [Int: Int] = [:]
    var fractionalDigit: [Character] = []
    var index = 0
    
    while num != 0 {
        print(result)
        if let previousIndex = reminderIndex[num] {
            // repeating part found
            let nonRepeating = String(fractionalDigit.prefix(previousIndex))
            let repeating = String(fractionalDigit.suffix(from: previousIndex))
            result += nonRepeating + "(" + repeating + ")"
            return result
        }
        
        reminderIndex[num] = index
        num *= 10
        let digit = num / den
        fractionalDigit.append(Character(String(digit)))
        num = num % den
        index += 1
    }
    // Terminating decimal
    result += String(fractionalDigit)
    return result
}

print(fractionToDecimal(1, 3))
