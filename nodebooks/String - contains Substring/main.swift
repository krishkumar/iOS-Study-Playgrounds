import Foundation 

extension String {
    func contains(_ s2: String) -> Bool {
        if self.range(of: s2) != nil {
            return true
        }
        return false
    }
}
print("HOLA".contains("Good"))
                      