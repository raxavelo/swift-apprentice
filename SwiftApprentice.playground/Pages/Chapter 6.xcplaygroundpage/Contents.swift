//: [Previous](@previous)

import Foundation

// Chapter 5: Optionals

/*
 Challenge 1: You be the compiler
 
 Which of the following are valid statements?
 
 var name: String? = "Ray"          // valid
 var age: Int = nil                 // invalid
 let distance: Float = 26.7         // valid
 var middleName: String? = nil      // valid
 */

/*
 Challenge 2: Divide and conquer
 
 First, create a function that returns the number of times
 an integer can be divided by another integer without a remainder.
 The function should return nil if the division doesn’t produce a whole number.
 Name the function divideIfWhole.
 
 Then, write code that tries to unwrap the optional result of the function.
 There should be two cases: upon success, print "Yep, it divides \(answer) times",
 and upon failure, print "Not divisible :[".
 
 Finally, test your function:
 
 1. Divide 10 by 2. This should print "Yep, it divides 5 times."
 2. Divide 10 by 3. This should print "Not divisible :[."
 
 Hint 1: Use the following as the start of the function signature:
 
 func divideIfWhole(_ value: Int, by divisor: Int)
 
 Hint 2: You can use the modulo operator (%) to determine if a value is divisible by another;
 recall that this operation returns the remainder from the division of two numbers.
 For example, 10 % 2 = 0 means that 10 is divisible by 2 with no remainder,
 whereas 10 % 3 = 1 means that 10 is divisible by 3 with a remainder of 1.
 */

func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
  if value % divisor == 0 {
    return value / divisor
  }
  return nil
}

if let result = divideIfWhole(10, by: 2) {
  print("Yep, it divides \(result) times")
} else {
  print("Not divisible :[")
}

if let result = divideIfWhole(10, by: 3) {
  print("Yep, it divides \(result) times")
} else {
  print("Not divisible :[")
}

/*
 Challenge 3: Refactor and reduce
 
 The code you wrote in the last challenge used if statements.
 In this challenge, refactor that code to use nil coalescing instead.
 This time, make it print "It divides X times" in all cases,
 but if the division doesn’t result in a whole number, then X should be 0.
 */

print("It divides \(divideIfWhole(10, by: 2) ?? 0) times")
print("It divides \(divideIfWhole(10, by: 3) ?? 0) times")

/*
 Challenge 4: Nested optionals
 
 Consider the following nested optional — it corresponds to a number inside a box inside a box inside a box.
 
 let number: Int??? = 10
 
 If you print number you get the following:
 
 print(number)
 // Optional(Optional(Optional(10)))

 print(number!)
 // Optional(Optional(10))
 
 Do the following:
 
 1. Fully force unwrap and print number.
 2. Optionally bind and print number with if let.
 3. Write a function printNumber(_ number: Int???) that uses guard to print the number only if it is bound.
 */

let number: Int??? = 10

// 1:
print(number!!!)

// 2:
if let n1 = number,
    let n2 = n1,
    let n3 = n2 {
  print(n3)
}

// 3:
func printNumber(_ number: Int???) {
  guard let n1 = number, let n2 = n1, let n3 = n2 else {
    return
  }
  print(n3)
}

printNumber(number)
//: [Next](@next)
