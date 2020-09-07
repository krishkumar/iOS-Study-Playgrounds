extension String {
    func clsws() -> String {
        var prevSpace: Bool = false
        var used = [Character]()
        
        for item in self {            
            if item == " "  {
                if prevSpace {
                    
                } else {
                    prevSpace = true
                    used.append(item)          
                }
            } else {
                prevSpace = false
                used.append(item)          
            }
            //print(item)
        }
        return String(used)
    }
}

print("O HO".clsws())
print("A  B   C".clsws())
print("          A        B".clsws())
print("ABC".clsws())


