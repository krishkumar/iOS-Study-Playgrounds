print("Hello, World!")

func oneAway(_ s1:String, _ s2:String) -> Bool {
    //
    if abs (s1.count - s2.count) > 1 {
        return false
    }
    
        //replace
    var s1s = s1.sorted()
    var s2s = s2.sorted()
    print(s1s)
    print(s2s)
    var tolerance = 1
    for c1 in s1s { 
        for c2 in s2s {
            if c1 != c2 {
                tolerance -= 1
            }
            if tolerance == 0 {
            }
            return false
        }
    }
    return true

}

print(oneAway("cba","ab")) // t1 insert, delete
