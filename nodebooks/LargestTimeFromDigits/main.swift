class Solution {
    func largestTimeFromDigits(_ B: [Int]) -> String {
        // HH max - 24
        // mm max - 59
        var A = B
        var op:[Int] = []
        for i in 0...3 {
            switch(i) {
                case 0:
                    for j in (0...2).reversed() {
                        if let item = A.firstIndex(of: j) {
                            op.append(A[item])
                            A.remove(at: item)
                            break
                        }
                        if j == 0 { return ""}
                    }
                case 1:
                    for j in (0...4).reversed() {
                        if let item = A.firstIndex(of: j), Int("\(op[0])\(A[A.firstIndex(of: j)!])")! < 24        {
                            op.append(A[item])
                            A.remove(at: item)
                            break
                        }
                        if j == 0 { return ""}
                    }
            case 2: for j in (0...5).reversed() {
                if let item = A.firstIndex(of: j) {
                    op.append(A[item])
                    A.remove(at: item)
                    break
                }
            }
            default:
                op.append(A[0])
            }
        }
        let op1 = op[0..<2].map { String($0)
        }.joined()
        let op2 = op[2..<4].map { String($0)
        }.joined()
        return  op1 + ":" + op2
    }
}




let s = Solution()
print(s.largestTimeFromDigits([4,2,4,4]))

