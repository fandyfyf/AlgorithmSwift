class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ret = [[Int]]()        
        dfs(&ret, [Int](), 1, n, k)
        return ret
    }
    
    func dfs(_ list: inout [[Int]], _ path: [Int], _ index: Int, _ n: Int, _ k: Int) {
        
        if path.count == k {
            list.append(path)
            return
        }
        
	// To avoid upper bound < lower bound
        if index > n {
            return
        }
            
        for i in index...n {
            var updatedPath = Array(path)
            updatedPath.append(i);
            
            dfs(&list, updatedPath, i+1, n, k)
        }
    }
}
