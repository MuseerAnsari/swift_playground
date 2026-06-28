// https://leetcode.com/problems/merge-two-sorted-lists/
/*
 You are given the heads of two sorted linked lists list1 and list2.
 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
 Return the head of the merged linked list.
 
 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 */


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    
    guard let list1 else { return list2 }
    guard let list2 else { return list1 }
    
    if list1.val < list2.val {
        list1.next = mergeTwoLists(list1.next, list2)
        return list1
    } else {
        list2.next = mergeTwoLists(list2.next, list1)
        return list2
    }
}

let node1 = ListNode(2)
let list = ListNode(1, node1)
mergeTwoLists(list, nil)

func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    
    var l1 = list1
    var l2 = list2
    var list = ListNode(0)
    var tail: ListNode? = list
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            tail?.next = l1
            l1 = l1?.next
        } else {
            tail?.next = l2
            l2 = l2?.next
        }
        tail = tail?.next
    }
    tail?.next = l1 ?? l2
    
    return list.next
}
