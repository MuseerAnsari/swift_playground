// https://leetcode.com/problems/integer-to-roman/description/


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
