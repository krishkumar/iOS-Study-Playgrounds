class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        for i in 0..<n {
            print(m+i)
            nums1[m+i] = nums2[i]
        }
        nums1.sort()
    }
}


let s = Solution()
var a1 = [1,2,3,0,0,0]
var a2 = [2,5,6]
s.merge(&a1, 3, a2, 3)
print(a1)
