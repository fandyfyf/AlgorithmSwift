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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        guard let root = root else {
            return [String]()
        }
        
        var list = [String]()
        treeTraverse(root, "", &list)
        return list
    }
    
    func treeTraverse(_ root: TreeNode, _ sequence: String, _ list: inout [String]) {
        
        if root.left == nil && root.right == nil {
            let result = sequence + "\(root.val)"
            list.append(result)
            return
        }
        
        if let node = root.left {
            treeTraverse(node, sequence + "\(root.val)->", &list)
        } 
        
        if let node = root.right {
            treeTraverse(node, sequence + "\(root.val)->", &list)
        }
    }
}
