//You are given a string containing characters  and  only. Your task is to change it into a string such that there are no matching adjacent characters. To do this, you are allowed to delete zero or more characters in the string.
//Your task is to find the minimum number of required deletions.
//Example 
// s = AABAAB
//Remove an  at positions  and  to make  in  2 deletions.

// Complete the alternatingCharacters function below.
func alternatingCharacters(_ s: String) -> Int {
    let arr = Array(s)
    var op:[String] = []
    var seen: Character = Character(" ".uppercased())
    var ops = 0
    for (i,c) in arr.enumerated() {
        print(i,c)
        if seen == c {
            // 
            ops += 1
        } else {
            op.append(String(c))
        }        
        seen = c
        
    }
    return ops
}

print(alternatingCharacters("AABAAB"))
