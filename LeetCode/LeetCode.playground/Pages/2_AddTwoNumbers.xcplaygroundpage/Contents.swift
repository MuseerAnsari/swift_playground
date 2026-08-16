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

func addTwoNums(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var l1Pointer = l1
    var l2Pointer = l2
    
    let result = ListNode(0)
    var resultPointer: ListNode? = result
    var carry = 0
    
    
    while l1Pointer != nil || l2Pointer != nil {
        
        var sum = carry
        
        if let a = l1Pointer?.val {
            sum += a
            l1Pointer = l1Pointer?.next
        }
        
        if let b = l2Pointer?.val {
            sum += b
            l2Pointer = l2Pointer?.next
        }
        
        let digit = sum % 10
        carry = sum / 10
        resultPointer?.next = ListNode(digit)
        resultPointer = resultPointer?.next
    }
    
    if carry > 0 {
        resultPointer?.next = ListNode(carry)
    }
    
    return result.next
}
