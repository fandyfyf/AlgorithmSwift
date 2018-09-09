class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        var ret = [Character]()
        
        var charactersA = Array(a)
        var charactersB = Array(b)
        
        var carry = 0
        
        while !charactersA.isEmpty || !charactersB.isEmpty {
                 
            var sum = carry
            if let val1 = charactersA.popLast() {
                sum += Int(String(val1))!
            }
            
            if let val2 = charactersB.popLast() {
                sum += Int(String(val2))!
            }
            
            if sum == 0 {
                carry = 0
                ret.insert("0", at: 0)
            } else if sum == 1 {
                carry = 0
                ret.insert("1", at: 0)
            } else if sum == 2 {
                carry = 1
                ret.insert("0", at: 0)
            } else if sum == 3 {
                carry = 1
                ret.insert("1", at: 0)
            }
        }
        
        if carry > 0 {
            ret.insert("1", at: 0)
        }
        
        return String(ret)
    }
}
