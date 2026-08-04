/*
 // Test cases
    print(smallestSubarrayWithSumExceeding([2, 3, 1, 2, 4, 3], 7))
 // Output: 2 (subarray [4, 3])
 */

func smallestSubarrayWithSumExceeding(_ nums: [Int], _ k: Int) -> Int {
    
    var minLenght = Int.max
    let count = nums.count
    var left = 0
    var currentSum = 0
    
    for right in 0..<count {
        // Expand window by adding element at right
        currentSum += nums[right]
        // Shrink window from left while sum exceeds k
        while currentSum > k {
            minLenght = min(minLenght, right - left + 1)
            currentSum -= nums[left]
            left += 1
        }
    }
 
    return minLenght == Int.max ? 0 : minLenght
}

print(smallestSubarrayWithSumExceeding([2, 3, 1, 2, 4, 3], 7))
