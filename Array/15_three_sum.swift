// 15. Three Sum
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var ret = [[Int]]()
        if nums.count < 3 {
            return ret
        }

        // O(NLogN)
        let sortedNums = nums.sorted()

        for i in 0...sortedNums.count-1 {

            if i-1 >= 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }

            let first = sortedNums[i]

            var left = i+1
            var right = sortedNums.count-1

            while left < right {

                let second = sortedNums[left]
                let third = sortedNums[right]

                let total = first + second + third

                if total < 0 {
                    left += 1
                } else if total > 0 {
                    right -= 1
                } else {
                    // total equals zero
                    // should avoid duplicates
                    ret.append([first, second, third])

                    while left < right && sortedNums[left] == second {
                        left += 1
                    }

                    while left < right && sortedNums[right] == third {
                        right -= 1
                    }
                }
            }
        }
        return ret
    }
}
