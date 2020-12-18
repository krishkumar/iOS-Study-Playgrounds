//Input: releaseTimes = [9,29,49,50], keysPressed = "cbcd"
//Output: "c"
//Explanation: The keypresses were as follows:
//Keypress for 'c' had a duration of 9 (pressed at time 0 and released at time 9).
//Keypress for 'b' had a duration of 29 - 9 = 20 (pressed at time 9 right after the release of the previous character and released at time 29).
//Keypress for 'c' had a duration of 49 - 29 = 20 (pressed at time 29 right after the release of the previous character and released at time 49).
//Keypress for 'd' had a duration of 50 - 49 = 1 (pressed at time 49 right after the release of the previous character and released at time 50).
//The longest of these was the keypress for 'b' and the second keypress for 'c', both with duration 20.
//'c' is lexicographically larger than 'b', so the answer is 'c'.

    //func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {

func slowestKeyPress(_ ar: [Int], _ ks: String) -> Character {
    let ksarr = Array(ks)
    var startTime = 0
    var maxPressed = (0,"")
    for (i,c) in ksarr.enumerated() {
        let interval = ar[i] - startTime
        if (interval > maxPressed.0) {            
                maxPressed = (interval, String(c))
            } 
        else if (interval == maxPressed.0) {
            if c > Character(maxPressed.1) {
                maxPressed = (interval, String(c))
            }
        }
        startTime = ar[i]
    }
    return Character(maxPressed.1)
}
print(slowestKeyPress([9,29,49,50],"cbcd"))
