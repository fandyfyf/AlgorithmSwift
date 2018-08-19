class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        if word.count == 0 { return true }
        if board.count == 0 { return false }
        if board[0].count == 0 { return false }
        
        let characters = Array(word)
        let height = board.count
        let width = board[0].count
        
        for i in 0...height-1 {
            
            for j in 0...width-1 {
                
                // If the current character is the start of the word
                if board[i][j] != characters[0] {
                    continue
                }
                
                var visited = Array(repeating: Array(repeating: false, count: width), count: height)
                let result = dfs(board, &visited, 0, characters, i, j)
                
                if result {
                    return true   
                }
            }
        }
        return false
    }
    
    func dfs(_ board: [[Character]], _ visited: inout [[Bool]], _ searchIndex: Int, _  characters: [Character], _ x: Int, _ y: Int) -> Bool {
        if searchIndex == characters.count {
            return true
        }
        
        let height = board.count
        let width = board[0].count
        
        if x < 0 || y < 0 || x >= height || y >= width { return false }
        if visited[x][y] { return false }
        
        if characters[searchIndex] == board[x][y] {
            
            visited[x][y] = true
            
            var result = dfs(board, &visited, searchIndex+1, characters, x+1, y) 
            || dfs(board, &visited, searchIndex+1, characters, x-1, y)
            || dfs(board, &visited, searchIndex+1, characters, x, y+1)
            || dfs(board, &visited, searchIndex+1, characters, x, y-1) 
            
            if result {
                return true
            }
            
            visited[x][y] = false
        }
        return false
    }
}
