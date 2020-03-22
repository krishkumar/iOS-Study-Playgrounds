import UIKit

// protocols

/// protocol define
protocol MyProtocol {
    // definition
}

struct MyStruct: MyProtocol {
    // structure defintion
}

/// property requirements
protocol FullName {
    var firstName: String { get set }
    var lastName: String { get set }
    static var typeProperty: String { get }
    func getFullName() -> String
    //mutating func editName()
}

protocol Person: FullName {
    var age: Int { get set }
}

struct Student: Person {
    var age: Int = 0
    
    static var typeProperty: String = "Student"
    
    func getFullName() -> String {
        return "\(firstName), \(lastName)"
    }
        
    var firstName: String = ""
    var lastName: String = ""
}

/// protocol types


/// protocol associated types - compile time polymorphism
protocol Queue {
    associatedtype QueueType
    mutating func pushFront(item: QueueType)
    mutating func popFront() -> QueueType?
    func count() -> Int
}

struct IntQueue : Queue {
    var items: [Int] = []
    mutating func pushFront(item: Int) {
        items.append(item)
    }
    
    mutating func popFront() -> Int? {
        items.popLast()
    }
    
    func count() -> Int {
        items.count
    }
    
    typealias QueueType = Int
}

/// protocol associated types - runtime polymorphism with generics
struct QueueAll<T> : Queue {
    func count() -> Int {
        return items.count
    }
    
    typealias QueueType = T
    
    var items: [T] = []
    mutating func pushFront(item: T) {
        //
        items.append(item)
    }
    mutating func popFront() -> T? {
        items.popLast()
    }
}

let qall1 = QueueAll(items: [CGFloat(integerLiteral: 20),CGFloat(integerLiteral: 25)])
print(qall1.count())


// protocol delegates
protocol DisplayNameDelegate {
    func displayName(name: String)
}

struct Employee: Person {
    var age: Int = 0
    
    static var typeProperty: String = "Employee"

    var delegate: DisplayNameDelegate
    
    var firstName: String = "" {
        didSet {
            delegate.displayName(name: getFullName())
        }
    }
    var lastName: String = "" {
        didSet {
            delegate.displayName(name: getFullName())
        }
    }
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

struct DisplayComponent: DisplayNameDelegate {
    func displayName(name: String) {
        print("Name: \(name)")
    }
}

var component = DisplayComponent()
var e1 = Employee(delegate: component)
e1.lastName = "Doe"
e1.firstName = "John"

// extensions
extension String {
    func getFirstChar() -> Character? {
        guard  self.count > 0 else {
            return nil
        }
        return self[startIndex]
    }
}

print("swift".getFirstChar()!)

extension URLRequest {
    mutating func addAPIkey(key: String) {
        self.addValue(key, forHTTPHeaderField: "api-key")
    }
}

let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
let session = URLSession.shared.dataTask(with: request) {data,_,_ in
    if let jsonData = data {
        if let str = String(data: jsonData, encoding: .utf8) {
            print(str)
        }
    }
}
session.resume()

// protocol extensions
extension Collection {
    func random() -> Element? {
        guard let first = self.shuffled().first else {
            return nil
        }
        return first
    }
}

[1,3,5].random()
["yes", "si", "ja"].random()

extension Collection where Self: ExpressibleByArrayLiteral {
}

extension Collection where Element: Comparable {
}

extension Employee : Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.getFullName())
    }
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.hashValue == rhs.hashValue
        //return lhs.age == rhs.age
    }
}

print(e1.getFullName())
var e2 = Employee(delegate: component)
e2.firstName = "Jack"
e2.lastName = "Brown"

print(e1 == e2)

