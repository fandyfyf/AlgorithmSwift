class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        
        var left = 0
        var right = citations.count-1
        var length = citations.count
        
        while left<=right {
            let mid = (left + right) / 2
            if citations[mid] >= length - mid {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return length - left
    }
}
