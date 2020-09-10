// https://leetcode.com/contest/weekly-contest-205/problems/minimum-deletion-cost-to-avoid-repeating-letters/
class Solution {
    func minCost(_ s: String, _ cost: [Int]) -> Int {
        let sArr = Array(s)
        var match = 0
        var currentCost = 0
        var nextCost = 0
        for (current, next) in zip(sArr, sArr.dropFirst()) {
            print(current,next)
            nextCost += 1
            if current == next {                
                print("Current: match at \(currentCost) - cost \(cost[currentCost])")
                print("Next: match at \(nextCost) - cost \(cost[nextCost])")
                if cost[currentCost] <= cost[nextCost] {
                    print("cheaper current")
                    match += cost[currentCost]
                } else {
                    print("cheaper next")
                    match += cost[nextCost]
                }                
            }
            currentCost += 1
        }
        return match
    }
}

let s = Solution()
//let result = s.minCost("abaac", [1,2,3,4,5]) // OK
//let result = s.minCost("abc", [1,2,3]) // OK
let result = s.minCost("aabaa", [1,2,3,4,1]) 
print(result)

// Input: s = "abaac", cost = [1,2,3,4,5]
// Output: 3
// xplanation: Delete the letter "a" with cost 3 to get "abac" (String without two identical letters next to each other).

// Input: s = "abc", cost = [1,2,3]
// Output: 0
// Explanation: You don't need to delete any character because there are no identical letters next to each other.

// Input: s = "aabaa", cost = [1,2,3,4,1]
// Output: 2
// Explanation: Delete the first and the last character, getting the string ("aba").


