/*
→ mapand flatMap — transform the elements
→ filter - include only certain elements
→ allSatisfy — test all elements for a condition
→ reduce — fold the elements into an aggregate value
→ forEach — visit each element
→ sort(by:),sorted(by:),lexicographicallyPrecedes(_:by:),andpartition(by:)— reorder the elements
→ firstIndex(where:),lastIndex(where:),first(where:),last(where:),and contains(where:) — does an element exist?
→ min(by:)andmax(by:)—findtheminimumormaximumofallelements
→ elementsEqual(_:by:)andstarts(with:by:)—comparetheelementstoanother
array
→ split(whereSeparator:)—breakuptheelementsintomultiplearrays
→ pre􏰀x(while:)—takeelementsfromthestartaslongastheconditionholdstrue
→ drop(while:)—dropelementsuntiltheconditionceasestobetrue,andthen return the rest (similar to pre􏰀x, but this returns the inverse)
→ removeAll(where:)—removetheelementsmatchingthecondition
*/
var ar = [1,1,3,2,4,1]
let m = ar.map { String($0) }
let str = "The quick brown fox jumps over the lazy dog"
//print(m)

//if let idx = ar.firstIndex { item in item % 2 == 0 } {
    //print(idx)
//}

//let sq = ar.map { $0+$0 }
//print(sq)

//let mm = m.map { $0+$0 }
//print(mm)

//let iar = ar.filter { $0 % 2 == 0 } 
//print(iar)

//let result = str.allSatisfy({ $0 == Character("a") || $0 == Character("e") || $0 == Character("i") || $0 == Character("o") || $0 == Character("u") })

//let result = ar.reduce(0) { $0+$1 }
//let result = str.reduce("") { result, element in 
  //                           String(element)+String(result) }
//let result = ar.sorted()
let result = str.sorted()
//print(ar)
print(Set(result).count)
print(Array(Set(result).sorted()))
//print(result)

