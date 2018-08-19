class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        
        var list = [String]()
        if digits.count == 0 {
            return list
        }
        
        let reference = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var sequence = [Character]()
        
        dfs(Array(digits), reference, &list, sequence, 0)
        
        return list
    }
    
    func dfs(_ digits: [Character], _ reference: [String] ,_ list: inout [String], _ sequence: [Character], _ searchIndex: Int) {
        
        if searchIndex == digits.count {
            list.append(String(sequence))
            return
        }
        
        let key = Int(String(digits[searchIndex]))
        let characters = Array(reference[key!])
        
        for character in characters {
            var updatedSequence = Array(sequence)
            updatedSequence.append(character)
            dfs(digits, reference, &list, updatedSequence, searchIndex+1)
        }
    }
}
