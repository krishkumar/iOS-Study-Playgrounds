// Given two strings, determine if they share a common substring. A substring may be as small as one character.
//We have  pairs to check:
// - The substrings  and  are common to both strings.
// - and  share no common substrings.

// Complete the twoStrings function below.
func twoStrings(s1: String, s2: String) -> String {
    let all = Array("abcdefghijklmnopqrstuvwxyz")
    for c in all {
        if let _ = s1.firstIndex(of:c), let _ = s2.firstIndex(of:c) {
            return "YES"
        }
    }    
    return "NO"
}

print(twoStrings(s1:"hello", s2:"world"))
print(twoStrings(s1:"hi", s2:"world"))
print(twoStrings(s1:"jackandjill", s2:"wentupthehill"))
print(twoStrings(s1:"hackerrankcommunity", s2:"cdecdecdecde"))