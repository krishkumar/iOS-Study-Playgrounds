import Foundation
extension String {
    func isRotation(_ s2: String) -> Bool {
        if self.count != s2.count { return false }
        let total = self + self
        return total.contains(s2)
    }
}

print("HELLO".isRotation("OHELL"))
print("ABC".isRotation("A"))