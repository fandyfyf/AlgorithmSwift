// Remove duplicates from unsorted array
// 1) sort first, O(n*logn), and then O(n) to remove duplicates
// 2) hash, O(n)

// 26. Remove duplicates from sorted array
// O(n)
class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.count == 0 {
            return 0
        }

        var ret = 0
        for i in 0...nums.count-1 {
            if i-1>=0 && nums[i-1] == nums[i] {
                continue
            }
            nums[ret] = nums[i]
            ret += 1
        }
        return ret
    }
}
