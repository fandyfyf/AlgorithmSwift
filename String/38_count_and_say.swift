class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 { return "1" }
        
        var count = 1
        var str = "1"
        while count < n {
            str = countNext(str)
            count += 1
        }
        return str
    }
    
    func countNext(_ s: String) -> String {
        
        let characters = Array(s)
        
        var ret = ""
        var ref = characters[0]
        var count = 1
        
        for i in 1..<characters.count {
            
            let currChar = characters[i]
            if currChar == ref {
                count += 1
            } else {
                ret += "\(count)" + String(ref)
                ref = currChar
                count = 1
            }
        }
        ret += "\(count)" + String(ref)
        return ret
    }
}
