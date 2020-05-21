import UIKit

// Linked List
class LinkedListNode<T> {
    var key: T
    var value: T
    var next: LinkedListNode?
    init(key:T, value: T) {
        self.key = key
        self.value = value
    }
}

class LinkedList<T> {
    var head: LinkedListNode<T>?
    var isEmpty:Bool {
        return head == nil
    }
    
    var count:Int {
        var count = 0
        if head != nil {
            count = 1
        }
        var node = head
        while node?.next != nil {
           count = count + 1
            node = node?.next
        }
        return count
    }
}

let headNode = LinkedListNode<String>(key: "sunday", value: "eggs")
let list = LinkedList<String>()
list.head = headNode
headNode.next = LinkedListNode<String>(key: "monday", value: "avocado")
list.isEmpty
list.count

// Hash Table
class HashTable<Key:Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    var buckets: [Bucket]
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    func index(key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    subscript(key: Key) -> Value? {
        get {
            return value(key: key)
        }
        set {
            
        }
    }
    
    func value(key: Key) -> Value? {
        let index = self.index(key: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    func updateValue(_ value: Value, key: Key) -> Value? {
        let index = self.index(key: key)
        for (i,element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        buckets[index].append((key: key, value: value))
        return nil
    }
    
    func removeValue(key: Key ) -> Value? {
        let index = self.index(key: key)
        for (i,element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                return element.value
            }
        }
        return nil
    }
}

var h = HashTable<String,String>(capacity: 100)
h["firstname"] = "steve"

// resize hashtable?


