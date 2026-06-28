/*
 Given an array of integers nums and an integer target, return index of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.

 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 */
// -------------------------------------------------------------------------------

/*
 Space complexity: O(1)
 Time complexity: O(n)
 */
func twoSumSolution(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for i in 0..<nums.count {
        let num = nums[i]
        let compliment = target - num
        // Get index if already been stored in map
        if let index = map[compliment] {
            return [index, i] // map index and current index
        }
        map[num] = i
    }
    return []
}

twoSumSolution([2,7,11,15], 9)

/*
 Space complexity: O(1)
 Time complexity: O(n2)
 */
func twoSumSolution2(_ nums: [Int], target: Int) -> [Int] {
    for i in 0..<nums.count {
        let compliment = target - nums[i]
        for j in 1..<nums.count {
            if nums[j] == compliment {
                return [i, j]
            }
        }
    }
    return[]
}
twoSumSolution2([2, 7, 11, 15], target: 9)
