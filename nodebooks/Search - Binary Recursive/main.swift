func binarySearch(_ a: String, key: String, range: Range<Int>) -> Int? {
        
    if range.lowerBound >= range.upperBound { // key not found
        return nil
    }   
    let midth = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    print(midth)
    
    let at = Array(a)
    if String(at[midth]) > key {
        print("\(at[midth]) > \(key) - Go lower")
        return binarySearch(a, key: key, range: range.lowerBound ..< midth)
    } else if String(at[midth]) < key {
        print("\(at[midth]) < \(key) - Go upper")
        return binarySearch(a, key: key, range: midth + 1 ..< range.upperBound)
    } else {
        print("MATCH!")
        return midth
    }
}
let arange = UnicodeScalar("a").value...UnicodeScalar("z").value
let at = String(String.UnicodeScalarView(arange.compactMap(UnicodeScalar.init)))
 if let x = binarySearch(at, key: "f", range: 0..<at.count) {
     print(x)
 }
//print(binarySearch(at, key: "f", range: 0..<at.count))

