func same(_ s1: String, _ s2: String) -> Bool {
    let s2Arr = Array(s2.sorted())
    for (num,element) in Array(s1.sorted()).enumerated() {
        if s2Arr[num] == element {
        } else { return false }
    }
    return true
}
print(same("abc","cbAa              "))
print(same("A1B2","B1A2"))