class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        if nums.count == 0 || k < 1 { return 0 }
        
        var mutableNums = Array(nums)
        return getKth(&mutableNums, 0, mutableNums.count-1, k)
    }
    
    func getKth(_ nums: inout [Int], _ start: Int, _ end: Int, _ k: Int) -> Int {
        
        // Get the last number as pivot
        let pivot = nums[end]
        var left = start
        var right = end-1
        
        while left <= right {
            
            if nums[left] <= pivot {
                left += 1
            } else {
                let temp = nums[left]
                nums[left] = nums[right]
                nums[right] = temp
                right -= 1
            }
        }
        
        let temp = nums[left]
        nums[left] = pivot
        nums[end] = temp
        
        if k == nums.count - left { return pivot }
        if k < nums.count - left { return getKth(&nums, left+1, end, k) }
        return getKth(&nums, start, left-1, k)
    }
}
