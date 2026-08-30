import Foundation
// https://leetcode.com/problems/kth-largest-element-in-an-array/description/
/*
 Given an integer array nums and an integer k, return the kth largest element in the array.
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 Can you solve it without sorting?

  

 Example 1:
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 
 Example 2:
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
 */

func findKthLargest(_ nums: inout [Int], _ k: Int) -> Int {
    return quickSort(&nums, 0, nums.count - 1, k)
}

func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
    if left >= right { return -1 }
    let pivot = partition(&nums, left, right)
    if pivot == nums.count - k {
        return nums[pivot]
    }
    quickSort(&nums, left, pivot - 1, k)
    quickSort(&nums, pivot + 1, right, k)
    return nums[nums.count - k]
}

func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
   
    let pivot = nums[right]
    var i = left
    var j = left
    
    while j < right {
        if nums[j] < pivot {
            nums.swapAt(i, j)
            i += 1
        }
        j += 1
    }
    nums.swapAt(i, j)
    return i
}

var nums = [3,2,1,5,6,4]
//print(findKthLargest(&nums, 2))

func findKthLargest2(_ nums: inout [Int], _ k: Int) -> Int {
    
    var heap: [Int] = []
    
    for num in nums {
        heap.append(num)
        
        if heap.count > k {
            heap.sort()
            heap.removeFirst()
        }
    }
    return heap[0]
}
// var nums = [3,2,1,5,6,4]
// print(findKthLargest2(&nums, 3))


func findKthLargest3(_ nums: [Int], _ k: Int) -> Int {
    var bucket = Array(repeating: 0, count: 2_0001)
    for n in nums {
        bucket[n + 1_0000] += 1
    }
    var target = k
    for i in stride(from: 2_0000, to: -1, by: -1) {
        target -= bucket[i]
        if target <= 0 {
            return i - 1_0000
        }
    }
    return Int.min
}

print(findKthLargest3(nums, 2))
