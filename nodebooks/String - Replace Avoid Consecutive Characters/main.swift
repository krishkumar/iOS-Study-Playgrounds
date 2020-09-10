// https://leetcode.com/contest/weekly-contest-205/problems/replace-all-s-to-avoid-consecutive-repeating-characters/

class Solution {
    func modifyString(_ s: String) -> String {
        let all = "abcdefghijklmnopqrstuvwxyz"
        let allArr = Array(all)
        var sArr = Array(s)
        for i in 0..<s.count {
            if sArr[i] == "?" {
                var okArr = allArr
                if sArr.indices.contains(i+1) {
                    okArr = allArr.filter { $0 != sArr[i+1] } // next                
                }
                if sArr.indices.contains(i-1) {
                    okArr = okArr.filter { $0 != sArr[i-1] } // prev
                }
                sArr[i] = okArr.randomElement()!
            }    
        }
        return String(sArr)
    }
}

let s = Solution()
let result = s.modifyString("??yw?ipkj?")
print(result)
// "?zs"
// "ubv?w"
// "j?qg??b"
// "??yw?ipkj?"
