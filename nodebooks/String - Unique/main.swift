import Foundation

let s = "Test"

func unique(_ s: String) -> Bool {
    let ar = Array(s)
    let se:Set = Set(s)
    if se.count == s.count {
        return true
    }    
    return false
}

print(unique(s))
