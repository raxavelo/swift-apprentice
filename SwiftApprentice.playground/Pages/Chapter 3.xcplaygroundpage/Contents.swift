//: [Previous](@previous)

import Foundation

// Chapter 3: Basic Control Flow

/*
 Challenge 1: Find the error
 
 What’s wrong with the following code?
 
 let firstName = "Matt"

 if firstName == "Matt" {
   let lastName = "Galloway"
 } else if firstName == "Ray" {
   let lastName = "Wenderlich"
 }
 let fullName = firstName + " " + lastName

 My answer: The lastName constant exists only inside if statement, so you can't use it outside.
 */

/*
 Challenge 2: Boolean challenge
 
 In each of the following statements, what is the value of the Boolean answer constant?
 
 let answer = true && true                              // true
 let answer = false || false                            // false
 let answer = (true && 1 != 2) || (4 > 3 && 100 < 1)    // true
 let answer = ((10 / 2) > 3) && ((10 % 2) == 0)         // true
 */

/*
 Challenge 3: Snakes and ladders
 
 Imagine you’re playing a game of snakes & ladders that goes from position 1 to position 20.
 On it, there are ladders at position 3 and 7 which take you to 15 and 12 respectively.
 Then there are snakes at positions 11 and 17 which take you to 2 and 9 respectively.

 Create a constant called currentPosition which you can set to whatever position between 1 and 20 which you like.
 Then create a constant called diceRoll which you can set to whatever roll of the dice you want.
 Finally, calculate the final position taking into account the ladders and snakes, calling it nextPosition.
 */

let currentPosition = 3
let diceRoll = Int.random(in: 1...6)
let nextPosition: Int

if currentPosition + diceRoll == 3 {
  nextPosition = 15
} else if currentPosition + diceRoll == 7 {
  nextPosition = 12
} else if currentPosition + diceRoll == 11 {
  nextPosition = 11
} else if currentPosition + diceRoll == 17 {
  nextPosition = 9
} else {
  nextPosition = currentPosition + diceRoll
}

/*
 Challenge 4: Number of days in a month
 
 Given a month (represented with a String in all lowercase)
 and the current year (represented with an Int),
 calculate the number of days in the month.
 Remember that because of leap years, “february” has 29 days
 when the year is a multiple of 4 but not a multiple of 100.
 February also has 29 days when the year is a multiple of 400.
 */

let year = 2400
let month = "february"

let isLeapYear: Bool
let daysOfMonth: Int

if year % 4 == 0 {
  if year % 100 == 0 {
    if year % 400 == 0 {
      isLeapYear = true
    } else {
      isLeapYear = false
    }
  } else {
    isLeapYear = true
  }
} else {
  isLeapYear = false
}

if month == "january" {
  daysOfMonth = 31
} else if month == "february" {
  daysOfMonth = isLeapYear ? 29 : 28
} else if month == "march" {
  daysOfMonth = 31
} else if month == "april" {
  daysOfMonth = 30
} else if month == "may" {
  daysOfMonth = 31
} else if month == "june" {
  daysOfMonth = 30
} else if month == "july" {
  daysOfMonth = 31
} else if month == "august" {
  daysOfMonth = 31
} else if month == "september" {
  daysOfMonth = 30
} else if month == "october" {
  daysOfMonth = 31
} else if month == "november" {
  daysOfMonth = 30
} else if month == "december" {
  daysOfMonth = 31
}

/*
 Challenge 5: Next power of two
 
 Given a number, determine the next power of two above or equal to that number.
 */

let number = Int.random(in: 1...4)
var exponent = 0
var nextPowerOfTwo = 1

while nextPowerOfTwo < number {
  nextPowerOfTwo *= 2
  exponent += 1
}

print("Given number is \(number).\nNext power of two is \(nextPowerOfTwo) which is equal to 2**\(exponent)")

/*
 Challenge 6: Triangular number
 
 Given a number, print the triangular number of that depth.
 You can get a refresher of triangular numbers here:
 https://en.wikipedia.org/wiki/Triangular_number
 */

let depth = Int.random(in: 1...20)
var triangularNumber = 0

//var i = 0
//
//while i < depth {
//  i += 1
//  triangularNumber += i
//}

triangularNumber = (depth * (depth + 1)) / 2

print("Triangular number of \(depth) is \(triangularNumber)")

/*
 Challenge 7: Fibonacci
 
 Calculate the n’th Fibonacci number.
 Remember that Fibonacci numbers start its sequence with 1 and 1,
 and then subsequent numbers in the sequence are equal
 to the previous two values added together.
 You can get a refresher here:
 https://en.wikipedia.org/wiki/Fibonacci_number
 */

var fib1 = 1
var fib2 = 1
let n = Int.random(in: 1...20)
var i = 2

while i < n {
  let temp = fib2
  fib2 = fib1 + fib2
  fib1 = temp
  i += 1
}

print("n = \(n), fibonacci = \(fib2)")

/*
 Challenge 8: Make a loop
 
 Use a loop to print out the times table up to 12 of a given factor.
 */

let factor = Int.random(in: 1...16)
var accumulator = 0
i = 0

while i <= 12 {
  print("\(i) * \(factor) = \(accumulator)")
  accumulator += factor
  i += 1
}

/*
 Challenge 9: Dice roll table
 
 Print a table showing the number of combinations to create each number from 2 to 12
 given 2 six-sided dice rolls. You should not use a formula
 but rather compute the number of combinations exhaustively
 by considering each possible dice roll.
 */

var target = 2

while target <= 12 {
  var combinations = 0
  var dice1 = 1
  while dice1 <= 6 {
    var dice2 = dice1
    while dice2 <= 6 {
      if dice1 + dice2 == target {
        combinations += 1
      }
      dice2 += 1
    }
    dice1 += 1
  }
  print("\(target): \(combinations) combinations")
  target += 1
}
//: [Next](@next)
