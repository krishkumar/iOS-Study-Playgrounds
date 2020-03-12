import UIKit
import Foundation

// Generics

/// Generic Functions
let ints=[2,3]
var strs = ["ja","yes"]

func printAll<T>(items: [T]) {
    for item in items {
        print(item)
    }
}

printAll(items: ints)
printAll(items: strs)

/// Generic Struct
struct List<T> {
    var items:[T] = []
    mutating func addItem(_ item: T) {
        items.append(item)
    }
}

var l = List(items: strs)
l.addItem("si")

var l2 = List(items: ints)
l2.addItem(2)

var l3 = List<Int>(items: l2.items)
print(l3)

// extension for Generic Types
extension List {
    func totalCount() -> Int {
        return items.count
    }
}

print(l3.totalCount())

//  protocol constraint Generics
func equal<T: Equatable>(a:T,b:T)-> Bool {
    return a == b
}
equal(a: 1, b: 1)
equal(a: "yes", b: "si")

func inspect<T>(value: T) {
    print("Received \(type(of: value)) with the value \(value)")
}

// type of Generic type
inspect(value: l3)

// Generic Data Type
struct deque<T> {
    var array = [T]()
    mutating func pushBack(_ obj: T) {
        array.append(obj)
    }
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
    mutating func popBack() -> T? {
        array.popLast()
    }
    mutating func popFront() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}

var testDeque = deque<Int>()
testDeque.pushBack(5)
testDeque.pushFront(2)
testDeque.pushFront(1)
testDeque.popBack()

var test2Dq = deque<String>()
