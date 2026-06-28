/*
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
 
 Example 1:
 Input: x = 123
 Output: 321
 */

func reverse(_ x: Int) -> Int {
    var number = x
    var result = 0
    
    // iterate unit given number become 0
    while number != 0 {
        // reminder of current number
        let reminder = number % 10
        // append reminder and update result
        // first iteration result:  0 * 10 + 3 = 3
        // second iteration result: 3 * 10 + 2 = 32
        // third iteration result:  32 * 10 + 1 = 321
        result = (result * 10) + reminder
        // this will remove lat digit of number at every iteration
        number = number / 10
    }
    return (result > Int32.max) && (result < Int32.min) ? 0 : result
}

reverse(124)
