class Solution {
    
    // A hashmap to avoid duplicate searching
    var reference = [String: Bool]()
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        if let ret = reference[s] {
            return ret
        }
        
        for str in wordDict {
            
            if s == str {
                reference[s] = true
                return true
            }
            
            if s.hasPrefix(str) {
                let substrIndex = s.index(s.startIndex, offsetBy: str.count)
                let substr = String(s[substrIndex...])
                
                let ret = wordBreak(substr, wordDict)
                if ret {
                    reference[s] = true
                    return true
                }
            }
        }
        
        reference[s] = false
        return false
    }
}
