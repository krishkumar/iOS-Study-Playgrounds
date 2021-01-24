func insertSort(_ a: [Int]) -> [Int] {
    var sorted = a
    for i in 1..<sorted.count {
        var current = i
        let temp = sorted[current]
        while current > 0 && temp < sorted[current-1] {
            sorted.swapAt(current, current-1)
            current -= 1
        }
        sorted[current] = temp
    }
    return sorted
}
print(insertSort([8,5,3,1,7,9]))