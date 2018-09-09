/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        
        let count = numberOfNode(head)
        
        var curr = head
        return sortedListToBSTRecur(&curr, count)
    }
    
    func sortedListToBSTRecur(_ head: inout ListNode?, _ count: Int) -> TreeNode? {
        
        if count <= 0 || head == nil {
            return nil
        }
        
        let left = sortedListToBSTRecur(&head, count/2)
        
        let root = TreeNode(head!.val)
        root.left = left
        
        head = head!.next
        
        root.right = sortedListToBSTRecur(&head, count - count/2 - 1)
        return root
    }
    
    func numberOfNode(_ head: ListNode?) -> Int {
        var curr = head
        var count = 0
        while curr != nil {
            curr = curr?.next
            count += 1
        }
        return count
    }
}
