//https://leetcode.com/problems/roman-to-integer/description/
/*
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.

  

 Example 1:
 Input: s = "III"
 Output: 3
 Explanation: III = 3.
 */

//----------------- Solution ------------------------

//  If a Roman numeral is less than the one that follows (like ‘I’ before ‘V’ in “IV”), that means you need to subtract the value of the first one from the second (so “IV” is 4 because 5 - 1 = 4).
//  If a Roman numeral is greater than or equal to the next, its value is simply added to the result.

//  Update Index and Result:
//  When using the subtractive rule, you jump ahead by two characters (`i += 2`).
//  When just adding the value, you move to the next character (`i += 1`).

func romanToIntSolution(_ s: String) -> Int {
    
    let roman: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    var result = 0
    let chars = Array(s)
    var i = 0
    
    while i < chars.count {
        let value = roman[chars[i]] ?? 0
        if i + 1 < chars.count,
           let nextValue = roman[chars[i + 1]],
           value < nextValue {
            result += (nextValue - value)
            i += 2
        } else {
            result += value
            i += 1
        }
    }
    return result
}

romanToIntSolution("LVIII")

func romanToIntSolution2(_ s: String) -> Int {
    
    var array: [Int] = []
    var result = 0
    for char in s {
        switch char {
        case "I":
            array.append(1)
        case "V":
            array.append(5)
        case "X":
            array.append(10)
        case "L":
            array.append(50)
        case "C":
            array.append(100)
        case "D":
            array.append(500)
        case "M":
            array.append(1000)
        default:
            break
        }
    }
    
//    for (i, value) in array.enumerated() {
//        if  (i + 1) < array.count && value < array[i + 1] {
//            result += -value
//        } else {
//            result += value
//        }
//    }
//    return result
    
    // ----------- OR -------------
    
     for (i, value) in array.enumerated() {
         if  (i + 1) < array.count && value < array[i + 1] {
             array[i] *= -value
         }
     }
    
    return array.reduce(0, +)
}

romanToIntSolution2("IV")
