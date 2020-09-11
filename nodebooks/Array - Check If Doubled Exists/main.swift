class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        let doubled = arr.map { $0*2 }
        for (i,item) in arr.enumerated() {
            for (j,ditem) in doubled.enumerated() {
                if item == ditem && item != 0 {
                    print(i,j)
                    print(item,ditem)
                    return true
                }
            }            
        }
        return false
    }
}

let s = Solution()
//let result = s.checkIfExist([10,2,5,3]) // OK
let result = s.checkIfExist([-2,0,10,-19,4,6,-8]) // NOT OK
print(result)