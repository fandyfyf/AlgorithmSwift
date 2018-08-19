class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ret = [[Int]]()        
        dfs(&ret, [Int](), 1, n, k)
        return ret
    }
    
    func dfs(_ list: inout [[Int]], _ sequence: [Int], _ searchIndex: Int, _ n: Int, _ k: Int) {
        
        if sequence.count == k {
            list.append(sequence)
            return
        }
        
	// To avoid upper bound < lower bound
        if searchIndex > n {
            return
        }
            
        for i in searchIndex...n {
            var updatedSequence = Array(sequence)
            updatedSequence.append(i);
            
            dfs(&list, updatedSequence, i+1, n, k)
        }
    }
}
