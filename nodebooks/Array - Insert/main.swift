//Input: [1,0,2,3,0,4,5,0]
//Output: null
//Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        for item in arr.enumerated() {
            print(item.offset)
        }
    }
}

let s = Solution()
var a1 = [1,0,2,3,0,4,5,0]
s.duplicateZeros(&a1)