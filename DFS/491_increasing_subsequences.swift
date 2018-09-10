// Similar problem with Combination and Subset
// Only difference is that the order of the sequence must be increasing.
// And we need a set to prevent duplicates in the same interation

class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        
        var ret = [[Int]]()
        dfs(&ret, nums, [Int](), 0)
        return ret
    }
    
    func dfs(_ ret: inout [[Int]], _ nums: [Int], _ sequence: [Int], _ searchIndex: Int) {
        
        if sequence.count > 1 {
            ret.append(sequence)
        }
        
        // Make sure the duplicate number will not be used during the same iteration.
        var set = Set<Int>()
        
        for i in searchIndex..<nums.count {
            
            if set.contains(nums[i]) {
                continue
            }

            if sequence.isEmpty {
                dfs(&ret, nums, [nums[i]], i+1)
            } else {
                let lastDigit = sequence[sequence.count-1]
                if nums[i] >= lastDigit {
                    var updatedSequence = Array(sequence)
                    updatedSequence.append(nums[i])
                    dfs(&ret, nums, updatedSequence, i+1)
                }
            }
            set.insert(nums[i])
        }
    }
}
