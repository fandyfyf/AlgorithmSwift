// 209 Minimum Size Subarray sum
// O(N)
class MinSubArrayLen {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {

        if nums.count == 0 {
            return 0
        }

        var sum = 0
        var left = 0
        // Initialize the return value to be max integer
	var ret = Int.max

        for i in 0...nums.count-1 {
            sum += nums[i]

	    // accumulate the sum until larger than s.
            while sum >= s {
                ret = min(ret, Int(i + 1 - left))
                sum -= nums[left]
                left += 1
            }
        }
        return ret == Int.max ? 0 : ret
    }
}
