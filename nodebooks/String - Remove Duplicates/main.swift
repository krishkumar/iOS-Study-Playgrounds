extension String {
    func removeDups() -> String {
        var used = [Character]()
        
        for l in self {
            if !used.contains(l) {
                used.append(l)
            }
        }
        return String(used)
    }
}

print("HELLO".removeDups())