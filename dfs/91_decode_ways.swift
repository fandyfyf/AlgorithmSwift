class Solution {
    func numDecodings(_ s: String) -> Int {
        // If the string is empty, there is no way to decode it.
        if s.count == 0 { return 0 }
        
        // setup hashmap to avoid duplicate search
        var reference = [String: Int]()
        return decode(s, &reference)
    }
    
    func decode(_ s: String, _ reference: inout [String: Int]) -> Int {
        
        // If the sequence has been decoded, return saved value
        if let count = reference[s] {
            return count
        }
        
        let length = s.count
        // If decode has reached the end, that is one solution.
        if length == 0 {
            reference[s] = 1
            return 1
        }
        
        // If invalid number detected, return 0
        if s.hasPrefix("0") {
            reference[s] = 0
            return 0
        }
        
        // If string length is 1, there is only 1 solution.
        if length == 1 {
            reference[s] = 1
            return 1
        }
        
        // If string is equal or more than 2 numbers.
        let endIndex = s.index(s.startIndex, offsetBy: 2)
        let substr = String(s[..<endIndex])
        let num = Int(substr)
        
        var ret = 0
        let startIndex1 = s.index(s.startIndex, offsetBy: 1)
        let startIndex2 = s.index(s.startIndex, offsetBy: 2)
        
        // If the number is less than or equal to 26, there are two path to decode it.
        if num! <= 26 {
            ret = decode(String(s[startIndex1...]), &reference) + decode(String(s[startIndex2...]), &reference)
        } else {
            ret = decode(String(s[startIndex1...]), &reference)
        }
        
        // update reference
        reference[s] = ret
        return ret
    }
}
