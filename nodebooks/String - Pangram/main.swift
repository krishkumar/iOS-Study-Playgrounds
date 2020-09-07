extension String {
    func isPangram() -> Bool {        
        let se = Set(self)
        let l = se.filter { $0 >= "a" && $0 <= "z" }
        print(se)
        return l.count == 26
    }
}

print("The quick brown fox jumps over the lazy dog".isPangram())