//https://leetcode.com/explore/featured/card/fun-with-arrays/525/inserting-items-into-an-array/3245/
//Input: [1,0,2,3,0,4,5,0]
//Output: null
//Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var position:[Int] = []
        for item in arr.enumerated() {
            if item.element == 0 {
                position.append(item.offset)            
            }
        }
        print(position)
        for i in position {
            arr.insert(0, at:i)
        }
    }
}

let s = Solution()
var a1 = [1,0,2,3,0,4,5,0]
s.duplicateZeros(&a1)
print(a1)