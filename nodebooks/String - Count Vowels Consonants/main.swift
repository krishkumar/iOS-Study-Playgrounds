extension String {
    func t() -> (Int,Int) {
        var vc = 0
        var cc = 0
        
        for item in self.lowercased() {
            //let s = String(item)
            if "aeiou".contains(item) {
                vc += 1
            } else if "bcdfghjklmnpqrstvwxyz".contains(item) {
                cc += 1
            }
        }
        return (vc,cc)
    }
}

print("HeY".t())