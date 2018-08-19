class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 0 {
            return [[Int]]()
        }
        
        var ret = [[Int]]()
        var visited = Array(repeating: false, count: nums.count)    
        dfs(nums, &ret, &visited, [Int]())
        return ret
    }
    
    func dfs(_ nums: [Int], _ list: inout [[Int]], _ visited: inout [Bool], _ sequence: [Int]) {
        
        // end of sequence has reached, save sequence
        if sequence.count == nums.count {
            list.append(sequence)
            return
        }
        
        for i in 0...nums.count-1 {
            if visited[i] {
                continue
            }
            
            // mark the current number visited.
            visited[i] = true
            
            var updatedSequence = Array(sequence)
            updatedSequence.append(nums[i])
            
            dfs(nums, &list, &visited, updatedSequence)

            // clean up the visited map for next iteration
            visited[i] = false
        }
    }
}
