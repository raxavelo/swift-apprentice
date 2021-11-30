//: [Previous](@previous)

import Foundation

// Chapter 22: Error Handling

/*
 Challenge 1: Even strings
 
 Write a throwing function that converts a String to an even number, rounding down if necessary.
 */

enum NumberErrors: Error {
  case notANumber
}

func stringToEven(_ text: String) throws -> Int {
  guard let number = Int(text) else {
    throw NumberErrors.notANumber
  }
  return number - number % 2
}

do {
  try stringToEven("25")
} catch {
  print("Not a number!")
}

/*
 Challenge 2: Safe division
 
 Write a throwing function that divides type Int types.
 */

enum DivisionErrors: Error {
  case divisionByZero
}

func divide(_ a: Int, by b: Int) throws -> Int {
  guard b != 0 else {
    throw DivisionErrors.divisionByZero
  }
  return a / b
}

do {
  try divide(4, by: 0)
} catch {
  print("You can't divide by 0!")
}
//: [Next](@next)
