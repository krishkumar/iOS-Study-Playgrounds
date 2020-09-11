class Angles {

func addAngles(angles: String) -> String {

var openingCount = 0
var leadingOpenCounts = 0
var newAngles = ""

newAngles = angles

print("New angles \(newAngles)")

for c in newAngles {


    print("Char = \(String(c) )")

    if String(c) == ">" {

        if openingCount == 0 {
            leadingOpenCounts = leadingOpenCounts + 1
        }
        else {
            openingCount = openingCount - 1
        }

    }
    if String(c) == "<" {
        openingCount = openingCount + 1
    }

}

print("LeadingOpenCounts ***** = \(leadingOpenCounts)")
print("OpeningCount ***** = \(openingCount)")
print("Required Closing Count ***** = \(openingCount)")

for _ in 0..<leadingOpenCounts {

    newAngles = "<" + newAngles
}

for _ in 0..<openingCount {
    newAngles.append(">")
}

print(newAngles)
return newAngles
}

}

let angles = Angles()
//><<><
// ><<<>>>
print(angles.addAngles(angles: "><<><"))