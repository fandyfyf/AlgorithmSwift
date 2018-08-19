// 283 Move Zeroes
class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {

        var index = 0
        for num in nums {
            if num != 0 {
                nums[index] = num
                index += 1
            }
        }

	// fill the rest to be zeros
        if index < nums.count {
            for i in index...nums.count-1 {
                nums[i] = 0
            }
        }
    }
}
