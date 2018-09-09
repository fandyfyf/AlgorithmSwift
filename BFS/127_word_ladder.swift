class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {

        if !wordList.contains(endWord) {
            return 0
        }

        var queue = [String]()
        var visited = Set<String>()

        queue.append(beginWord)
        visited.insert(beginWord)

        var length = 1

        while queue.count != 0 {

            for _ in 0..<queue.count {

                let str = queue.removeFirst()

                for word in wordList {

                    if visited.contains(word) {
                        continue
                    }

                    if isValidTransform(word, str) {

                        if word == endWord {
                            return length + 1
                        }

                        queue.append(word)
                        visited.insert(word)
                    }
                }
            }

            length += 1
        }

        return 0
    }

    func isValidTransform(_ string1: String, _ string2: String) -> Bool {

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
