//https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3248/
//Given nums = [1,1,2],

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums))
        nums = nums.sorted()
        return nums.count
    }
}

var a1 = [1,1,2]
print(Solution().removeDuplicates(&a1))
print(a1)
print("\n")
var a2 = [0,0,1,1,1,2,2,3,3,4]
print(Solution().removeDuplicates(&a2))
print(a2)