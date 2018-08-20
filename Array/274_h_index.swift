class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sortedCitations = citations.sorted()
        
        for i in 0...sortedCitations.count-1 {
            if (sortedCitations.count - i) <= sortedCitations[i] { return sortedCitations.count - i}
        }
        return 0
    }
}
