// This problem is very similar to Combinations
// The only difference is that all the length is valid for a subset

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ret = [[Int]]()
        dfs(nums, [Int](), 0, &ret)
        return ret
    }
    
    func dfs(_ nums: [Int], _ sequence: [Int], _ searchIndex: Int, _ ret: inout [[Int]]) {
        
        // Append the current sequence into ret
        ret.append(sequence)
        
        for i in searchIndex..<nums.count {
            
            var updatedSequence = Array(sequence)
            updatedSequence.append(nums[i])
            
            // The search index should increment along with i, 
            // so there won't be duplicate access.
            dfs(nums, updatedSequence, i+1, &ret)
        }
    }
}
