// https://leetcode.com/problems/product-of-array-except-self/description/
/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 You must write an algorithm that runs in O(n) time and without using the division operation.

 Example 1:
 Input: nums = [1,2,3,4] // [4,3,2,1]
 Output: [24,12,8,6]
 */

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = [Int](repeatElement(1, count: nums.count))
    var prefix = 1
    var suffix = 1
    for i in 0..<nums.count {
        result[i] *= prefix
        prefix *= nums[i]
        result[nums.count - 1 - i] *= suffix
        suffix *= nums[nums.count - 1 - i]
    }
    return result
}

productExceptSelf([-1,1,0,-3,3])

func productExceptSelf2(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = [Int](repeatElement(1, count: nums.count))
    var prefix: [Int] = [Int](repeatElement(1, count: nums.count))
    var suffix: [Int] = [Int](repeatElement(1, count: nums.count))
    
    for i in 1..<nums.count {
        prefix[i] = nums[i - 1] * prefix[i - 1]
    }
    
    for i in (0..<nums.count - 1).reversed() {
        suffix[i] = nums[i + 1] * suffix[i + 1]
    }
    
    print("nums\(nums)\nprefix\(prefix)\nsuffix\(suffix)")
    
    for i in 0..<nums.count {
        result[i] = prefix[i] * suffix[i]
    }
    return result
}
productExceptSelf2([1,2,3,4])


// not optimised
func productExceptSelf3(_ nums: [Int]) -> [Int] {
    
    var result: [Int] = []
    for i in 0..<nums.count {
        var product = 1
        for j in 0..<nums.count {
            if i != j {
                product *= nums[j]
            }
        }
        result.append(product)
    }
    return result
}
productExceptSelf3([-1,1,0,-3,3])

func getMinCost(crew_id: [Int], job_id: [Int]) -> Int {
    guard
    crew_id.count > 0,
    job_id.count > 0,
    crew_id.count == job_id.count
    else { return 0 }
    var result = 0
    for i in 0..<crew_id.count {
        let crew = crew_id[i]
        let job = job_id[i]
        let distence = abs(crew - job)
        result += distence
    }
    return result
}
