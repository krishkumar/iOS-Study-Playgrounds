//Given nums = [3,2,2,3], val = 3,
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
     for i in (0..<nums.count).reversed() {
         //print(i)
         if nums[i] == val {
             nums.remove(at:i)
         }
     }
           return nums.count
    } 
}

let s = Solution()
var a1 = [3,2,2,3]
var a2 = [0,1,2,2,3,0,4,2]
print(s.removeElement(&a1,3))
print(s.removeElement(&a2,2))