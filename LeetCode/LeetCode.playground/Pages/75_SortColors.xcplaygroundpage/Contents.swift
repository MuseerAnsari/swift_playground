// https://leetcode.com/problems/sort-colors/description/?envType=problem-list-v2&envId=mk94ohdv
/*
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
 We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
 You must solve this problem without using the library's sort function.

 Example 1:
 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 
 Example 2:
 Input: nums = [2,0,1]
 Output: [0,1,2]
 */

// https://www.youtube.com/watch?v=6sMssUHgaBs
func sortColors(_ nums: inout [Int]) {
    
    var left = 0
    var mid = 0
    var right = nums.count - 1
    
    while mid <= right {
        switch nums[mid] {
        case 0:
            nums.swapAt(mid, left)
            left += 1
            mid += 1
        case 1:
            mid += 1
        case 2:
            nums.swapAt(mid, right)
            right -= 1
        default:
            ()
        }
    }
}

var colors = [2,0,2,1,1,0]
sortColors(&colors)
print(colors)
