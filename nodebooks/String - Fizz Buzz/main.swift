// Write a program that outputs the string representation of numbers from 1 to n.

// But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”. 

// n = 15,

//Return:
//[
//    "1",
//    "2",
//    "Fizz",
//    "4",
//    "Buzz",
//    "Fizz",
//    "7",
//    "8",
//    "Fizz",
//    "Buzz",
//    "11",
//    "Fizz",
//    "13",
//    "14",
//    "FizzBuzz"
// ]

func fizzBuzz(_ n: Int) -> [String] { 
    var op:[String] = []
    for i in 1...n {
        switch (i % 3 == 0, i % 5 == 0) {            
            case (false,false):
                op.append(String(i))
            case (false,true):
                op.append("Buzz")
            case (true,false):
                op.append("Fizz")
            case (true,true):
                op.append("FizzBuzz")
        }
    }
    return op
}

print(fizzBuzz(15))