
func isPalindrome(_ s: String) -> Bool {
    print(s)
    if Array(s) == Array(s.reversed()) {
        return true
    }
    return false
}

print(isPalindrome("ROTATOR"))
