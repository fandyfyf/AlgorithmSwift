// Solution1, sort the array and use two pointer from begin and end, O(nlogn)
// Solution2, using hashmap, O(n)
class TwoSum {

    // O(N)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var dict: [Int: Int] = [:]

        // Iterate through the array with index.
        for (index, element) in nums.enumerated() {
            let counterPart = target - element

            if let counterPartIndex = dict[counterPart] {
                return [ counterPartIndex, index ]
            }

            dict[element] = index
        }
        return []
    }
}
