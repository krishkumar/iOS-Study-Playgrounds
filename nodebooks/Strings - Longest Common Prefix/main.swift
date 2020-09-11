import Foundation
func solution(strings: [String]) -> String {
    // Type your solution here
    let firstString = strings.first!

    var (minString,maxString) = (firstString,firstString)
    for str in strings.dropFirst() {
        if str < minString { minString = str }
        else if str > maxString { maxString = str }
    }
    
    return minString.commonPrefix(with: maxString)
    //return strings.dropFirst().reduce(firstString) { $0.commonPrefix(with: $1) }
    return ""
}

print(solution(strings: ["abcdef","abcghi","abcabc"]))