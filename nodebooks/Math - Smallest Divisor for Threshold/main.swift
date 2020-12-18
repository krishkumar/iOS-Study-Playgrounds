  func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        guard let max = nums.max() else { return 1 }        
        var lower = 1
        var upper = max        
        while lower < upper {
            let mid = lower + (upper - lower) / 2
            let satisfied = checkThreshold(nums, threshold, mid)
            
            if satisfied {
                upper = mid
            } else {
                lower = mid + 1
            }
        }        
        return lower
    }
    
    private func checkThreshold(_ narr: [Int], _ t: Int, _ check: Int) -> Bool {
        return narr.reduce(0, { $0 + calculateDivisor ($1, check) }) <= t
    }
    
    private func calculateDivisor(_ n: Int, _ with: Int) -> Int {
        if n % with == 0 {
            return n / with
        } else {
            return (n / with) + 1
        }
    }

print(smallestDivisor([1,2,5,9],6))

