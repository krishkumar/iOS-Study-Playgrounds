func charcount(_ s: String, _ char: Character) -> Int {
    var c = 0
    for item in s {
        if item == char {
            c += 1
        }        
    }
    return c
}

print(charcount("Hacking With Swift","i"))


func charcount2(_ s: String, _ char: Character) -> Int {
 return s.reduce(0) { 
     $1 == char ? $0 + 1: $0
 }
}

print(charcount2("Hacking With Swift","i"))