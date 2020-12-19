// For example, given the string , the following two operations are performed: cde → cdd → cdc.
// Each reduction in the value of any letter is counted as a single operation. Find the minimum number of operations required to convert a given string into a palindrome.
// 1. He can only reduce the value of a letter by , i.e. he can change d to c, but he cannot change c to d or d to b.
// 2. The letter a may not be reduced any further.
import Foundation 

// Complete the theLoveLetterMystery function below.
func theLoveLetterMystery(_ s: String) -> Int {    
    if isPalindrome(s) {
        return 0
    }    
    let set = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]    
    
    let a = Array(s)
    var mid = a.count/2 + a.count % 2
    var ops = 0
    for (e1, e2) in zip(a.prefix(mid), a.reversed().prefix(mid)) {
        if let i1 = set.firstIndex(of: String(e1)), let i2 = set.firstIndex(of: String(e2)) {
            ops += abs(i1-i2)
        }
    }
    return ops
}

func isPalindrome(_ s: String) -> Bool {
    if Array(s) == Array(s.reversed()) {
        return true
    }
    return false
}

print(theLoveLetterMystery("test"))
// tenet