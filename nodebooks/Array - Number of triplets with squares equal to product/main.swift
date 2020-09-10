//https://leetcode.com/contest/weekly-contest-205/problems/number-of-ways-where-square-of-number-is-equal-to-product-of-two-numbers/

class Solution {
    func numTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var good: Int = 0
        for i in 0..<nums1.count {
            for j in 0..<nums2.count {
                for k in j+1..<nums2.count {
                    if nums2.indices.contains(k) {
                        let s1 = nums1[i]*nums1[i]
                        let s2 = nums2[j]*nums2[k]
                            //print("Type 1 - \(s1),\(s2)")
                            if s1 == s2 {
                                good += 1
                            }
                    }
                }                
            }
        }
        for i in 0..<nums2.count {
            for j in 0..<nums1.count {
                for k in j+1..<nums1.count {
                    if nums1.indices.contains(k) {
                        let s3 = nums2[i]*nums2[i]
                        let s4 = nums1[j]*nums1[k]
                        //print("Type 2 - \(s3),\(s4)")
                        if s3 == s4 {
                            good += 1
                        }
                    }
                }
            }
        }

        return good
    }
}

// Triplet

//Type 1: Triplet (i, j, k) if nums1[i]2 == nums2[j] * nums2[k] where 0 <= i < nums1.length and 0 <= j < k < nums2.length.

//Type 2: Triplet (i, j, k) if nums2[i]2 == nums1[j] * nums1[k] where 0 <= i < nums2.length and 0 <= j < k < nums1.length.
let s = Solution()
let result = s.numTriplets([7,4], [5,2,8,9]) // OK
//let result = s.numTriplets([1,1], [1,1,1]) // NOT OK
//let result = s.numTriplets([7,7,8,3], [1,2,9,7]) // NOT OK
//let result = s.numTriplets([4,7,9,11,23], [3,5,1024,12,18]) // OK
// Input: nums1 = [7,4], nums2 = [5,2,8,9] - 1
// Input: nums1 = [1,1], nums2 = [1,1,1] - 9
// Input: nums1 = [7,7,8,3], nums2 = [1,2,9,7] - 2
// Input: nums1 = [4,7,9,11,23], nums2 = [3,5,1024,12,18] - 0
print(result)