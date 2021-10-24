//: [Previous](@previous)

import Foundation

// Chapter 2: Types & Operations

/*
 Challenge 1: Coordinates
 
 Create a constant called coordinates and assign a tuple containing two and three to it.
 */

let coordinates = (2, 3)

/*
 Challenge 2: Named coordinate
 
 Create a constant called namedCoordinate with a row and column component.
 */

let namedCoordinete = (row: 2, column: 3)

/*
 Challenge 3: Which are valid?
 
 Which of the following are valid statements?
 
 let character: Character = "Dog" // ❌
 let character: Character = "🐶"  // ✅
 let string: String = "Dog"       // ✅
 let string: String = "🐶"        // ✅
 */

/*
 Challenge 4: Does it compile?
 
 let tuple = (day: 15, month: 8, year: 2015)
 let day = tuple.Day
 
 My answer: No, it doesn't. tuple doesn't have a member called "Day" but "day".
 Swift is case sensitive.
 
 Correct version:
 let day = tuple.day
 */

/*
 Challenge 5: Find the error
 
 What is wrong with the following code?
 
 let name = "Matt"
 name += " Galloway"

 My answer: The name is a constant, so you can't change the value of name.
 */

/*
 Challenge 6: What is the type of value?
 
 What is the type of the constant named value?
 
 let tuple = (100, 1.5, 10)
 let value = tuple.1

 My answer: value == 1.5
 */

/*
 Challenge 7: What is the value of month?
 
 What is the value of the constant named month?
 
 let tuple = (day: 15, month: 8, year: 2015)
 let month = tuple.month

 My answer: month == 8
 */

/*
 Challenge 8: What is the value of summary?
 
 What is the value of the constant named summary?
 
 let number = 10
 let multiplier = 5
 let summary = "\(number) multiplied by \(multiplier) equals \(number * multiplier)"

 My answer: summary == "10 multiplied by 5 equals 50"
 */

/*
 Challenge 9: Compute the value
 
 What is the sum of a and b, minus c?
 
 let a = 4
 let b: Int32 = 100
 let c: UInt8 = 12
 
 My answer:
 An expression (a + b) - c returns an error because operators works only on the same type values.
 (a + Int(b)) - Int(c) == 92
 */

/*
 Challenge 10: Different precision 𝜋s
 
 What is the numeric difference between Double.pi and Float.pi?
 
 My answer: Float.pi has less precision than Double.pi.
 */

//: [Next](@next)
