// This problem takes the exact approach as #127 Word Ladder

class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {

        if !bank.contains(end) {
            return -1
        }

        var queue = [String]()
        var scanned = Set<String>()

        queue.append(start)
        scanned.insert(start)

        var length = 0

        while queue.count != 0 {

            for _ in 0..<queue.count {

                let str = queue.removeFirst()

                for gene in bank {

                    if scanned.contains(gene) {
                        continue
                    }

                    if isValidMutation(gene, str) {

                        if gene == end {
                            return length + 1
                        }

                        queue.append(gene)
                        scanned.insert(gene)
                    }
                }
            }

            length += 1
        }

        return -1
    }

    func isValidMutation(_ string1: String, _ string2: String) -> Bool {

        let characters1 = Array(string1)
        let characters2 = Array(string2)

        var diff = 0
        for i in 0..<characters1.count {

            if characters1[i] != characters2[i] {
                if diff > 0 {
                    return false
                }
                diff += 1
            }
        }

        return diff == 1
    }
}
