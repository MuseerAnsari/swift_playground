// https://www.hackerrank.com/challenges/extra-long-factorials/problem
/*
 The factorial of the integer
 Calculate and print the factorial of a given integer.
 */

func factorials(n: Int) -> Int {
    if n == 1 {
      return 1
    }
    return n * factorials(n: n - 1)
}

func factorials2(n: Int) -> Int {
    if n == 0 || n == 1 {
      return 1
    }
    var result = 1
    for i in 2...n {
        result = result * i
    }
    return result
}



print(factorials2(n: 5))

// https://www.youtube.com/watch?v=XCHuZXx98lI
func extraLongFactorials(n: Int) -> String {
    
    if n == 0 || n == 1 {
        return "1"
    }
    
    var digits = [1]
    
    for i in 2...n {
        digits = multiply(i, digits)
    }
    
    return digits.reversed().map { String($0) }.joined()
}

func multiply(_ num: Int, _ digits: [Int]) -> [Int] {
    var result = [Int]()
    var carry = 0

    for digit in digits {
        let product = digit * num + carry
        result.append(product % 10)
        carry = product / 10
    }

    while carry > 0 {
        result.append(carry % 10)
        carry /= 10
    }

    return result
}

//print(extraLongFactorials(n: 5))

func extraLongFactorials2(_ n: Int) -> String {
    if n == 0 || n == 1 {
        return "1"
    }
    var result = [1]
    for i in 2...n {
        result = multiplyArrayByNum(result, i)
    }
    return result.map({String($0)}).joined()
}

func multiplyArrayByNum(_ array: [Int], _ num: Int) -> [Int] {
    var result: [Int] = []
    var carry = 0
    for digit in array.reversed() {
        let product = digit * num + carry
        let productDigit = product % 10
        carry = product / 10
        result.append(productDigit)
    }
    while carry > 0 {
        result.append(carry % 10)
        carry /= 10
    }
    return result.reversed()
}

// print(extraLongFactorials2(4))
