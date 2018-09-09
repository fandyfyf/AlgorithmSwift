class Solution {
    func countSegments(_ s: String) -> Int {
        
        let characters = Array(s)
        
        var started = false
        var count = 0
        for character in characters {
            
            if !started && character != " " {
                started = true
            } else if started && character == " " {
                count += 1
                started = false
            }
        }
        
        if started {
            count += 1
        }
        
        return count
    }
}
