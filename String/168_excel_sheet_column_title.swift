class Solution {
    func convertToTitle(_ n: Int) -> String {
        var number = n
        var characters = [Character]()
        
        while number != 0 {
            let char = Character(UnicodeScalar((number - 1) % 26 + 65)!)
            characters.insert(char, at:0)
            number = (number - 1) / 26
        }
        return String(characters)
    }
}
