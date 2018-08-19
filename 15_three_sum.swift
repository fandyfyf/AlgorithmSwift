// 15. Three Sum
class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var ret = [[Int]]()
        if nums.count < 3 {
            return ret
        }

        // O(NLogN)
        let sortedNums = nums.sorted()

        // O(N^2)
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
                    ret.append([first, second, third])

                    // should avoid duplicates
                    left += 1
                    while left < right && sortedNums[left-1] == sortedNums[left] {
                        left += 1
                    }

                    right -= 1
                    while left < right && sortedNums[right+1] == sortedNums[right] {
                        right -= 1
                    }
                }
            }
        }
        return ret
    }
}
