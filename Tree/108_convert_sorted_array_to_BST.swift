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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {        
        return buildTree(nums, 0, nums.count-1)
    }
    
    func buildTree(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        
        let mid = (start + end) / 2
        let node = TreeNode(nums[mid])
        node.left = buildTree(nums, start, mid-1)
        node.right = buildTree(nums, mid+1, end)
        return node
    }
}
