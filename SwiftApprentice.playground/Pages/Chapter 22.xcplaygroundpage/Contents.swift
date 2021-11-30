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
//: [Next](@next)
