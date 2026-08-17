// https://leetcode.com/problems/integer-to-roman/description/
/*
 I    1
 V    5
 X    10
 L    50
 C    100
 D    500
 M    1000

 Example 1:

 Input: num = 3749
 Output: "MMMDCCXLIX"
 Explanation:
 3000 = MMM as 1000 (M) + 1000 (M) + 1000 (M)
  700 = DCC as 500 (D) + 100 (C) + 100 (C)
   40 = XL as 10 (X) less of 50 (L)
    9 = IX as 1 (I) less of 10 (X)
 Note: 49 is not 1 (I) less of 50 (L) because the conversion is based on decimal places
 
 */

func intToRoman(_ num: Int) -> String {
    let romanMap: [(symbol: String, value: Int)] = [
        ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
        ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
        ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)
    ]
    
    var number = num
    var result = ""
    
    for (symbol, value) in romanMap {
        while number >= value {
            result += symbol
            number -= value
        }
    }
    return result
}

intToRoman(3749)
