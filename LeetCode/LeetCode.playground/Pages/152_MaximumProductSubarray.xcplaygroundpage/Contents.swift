// https://leetcode.com/problems/maximum-product-subarray/description/
/*
 Given an integer array nums, find a subarray that has the largest product, and return the product.
 The test cases are generated so that the answer will fit in a 32-bit integer.
 Note that the product of an array with a single element is the value of that element.

 Example 1:
 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 
 Example 2:
 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 */

// https://www.youtube.com/watch?v=Y6B-7ZctiW8
func maxProduct(_ nums: [Int]) -> Int {

    guard nums.count > 0 else { return 0 }
    
    let n = nums.count
    var leftProduct = 1
    var rightProduct = 1
    var result = nums[0]
    
    for i in 0..<n {
        
        leftProduct = leftProduct == 0 ? 1 : leftProduct
        rightProduct = rightProduct == 0 ? 1 : rightProduct
        // prefix product
        leftProduct *= nums[i]
        // sufix product
        rightProduct *= nums[n - i - 1]
        result = max(result, max(leftProduct, rightProduct))
    }
    
    return result
}
