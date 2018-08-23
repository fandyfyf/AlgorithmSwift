class Solution {
    func titleToNumber(_ s: String) -> Int {        
        var ret = 0;
        for char in s.unicodeScalars {
            ret = ret * 26 + Int(char.value - 64)
        }
        return ret
    }
}
