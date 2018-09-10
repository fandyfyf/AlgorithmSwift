class Solution {
    
    // O(N^2)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        
        var dp = Array(repeating: 1, count: nums.count)

        var ret = 1
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            ret = max(ret, dp[i])
        }
        
        return ret
    }

    // O(NlogN)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var reference = [Int]()
        reference.append(nums[0])
        
        for i in 1..<nums.count {
            
            var start = 0
            var end = reference.count
            
            while start < end {
                let mid = (start + end) / 2
                
                if reference[mid] < nums[i] {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            
            if end >= reference.count {
                reference.append(nums[i])
            } else {
                reference[end] = nums[i]
            }
        }
        
        return reference.count
    }
}
