// https://leetcode.com/problems/add-two-numbers/description/

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: l1 = [2,4,3],
        l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      
        var l1 = l1
        var l2 = l2
        var carry = 0
        
        let result = ListNode(0)
        var pointer: ListNode? = result
        
        while l1 != nil || l2 != nil {
            
            var sum = 0 + carry
            
            if let l1Val = l1?.val {
                sum += l1Val
                l1 = l1?.next
            }
            
            if let l2Val = l2?.val {
                sum += l2Val
                l2 = l2?.next
            }
            
            carry = sum / 10
            let num = sum % 10
        
            pointer?.next = ListNode(num)
            pointer = pointer?.next
        }
        
        if carry == 1 {
            pointer?.next = ListNode(carry)
        }
        
        return result.next
    }
}
