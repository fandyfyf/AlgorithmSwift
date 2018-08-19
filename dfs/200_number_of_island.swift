Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        if grid.count == 0 { return 0 }
        if grid[0].count == 0 { return 0 }

        var count = 0
        let height = grid.count
        let width = grid[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        
        for i in 0...height-1 {
            for j in 0...width-1 {
                
                if grid[i][j] != "1" || visited[i][j] {
                    continue
                }
                
                count += 1
                dfs(grid, &visited, i, j)
            }
        }
        return count
    }
    
    func dfs(_ grid: [[Character]], _ visited: inout [[Bool]], _ x: Int, _ y: Int) {
        
        if x<0 || y<0 || x>=grid.count || y>=grid[0].count {
            return
        }
        
        if visited[x][y] {
            return
        }
        
        if grid[x][y] == "1" {
            visited[x][y] = true
            dfs(grid, &visited, x, y-1)
            dfs(grid, &visited, x, y+1)
            dfs(grid, &visited, x-1, y)
            dfs(grid, &visited, x+1, y)
        }
    }
}
