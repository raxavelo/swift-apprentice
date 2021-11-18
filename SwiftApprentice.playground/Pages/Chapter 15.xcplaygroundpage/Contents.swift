//: [Previous](@previous)

import Foundation

// Chapter 15: Enumerations

/*
 Challenge 1: Adding raw values
 
 Take the coin example from earlier in the chapter then begin with the following array of coins:
 
 enum Coin: Int {
   case penny = 1
   case nickel = 5
   case dime = 10
   case quarter = 25
 }

 let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

 Write a function where you can pass in the array of coins, add up the value and then return the number of cents.
 */

enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func sumCoins(in coins: [Coin]) -> Int {
  coins.reduce(0) {
    $0 + $1.rawValue
  }
}

sumCoins(in: coinPurse)

/*
 Challenge 2: Computing with raw values
 
 Take the example from earlier in the chapter and begin with the Month enumeration:
 
 enum Month: Int {
   case january = 1, february, march, april, may, june, july,
        august, september, october, november, december
 }

 Write a computed property to calculate the number of months until summer.
 
 Hint: You’ll need to account for a negative value if summer has already passed in the current year.
 To do that, imagine looping back around for the next full year.
 */

enum Month: Int {
  case january = 1, february, march, april, may, june, july,
       august, september, october, november, december
  
  var monthsUntilSummer: Int {
    var monthsLeft = Self.june.rawValue - self.rawValue
    if monthsLeft < 0 {
      monthsLeft += 12
    }
    return monthsLeft
  }
}

let month = Month.august
let monthsLeft = month.monthsUntilSummer

/*
 Challenge 3: Pattern matching enumeration values
 
 Take the map example from earlier in the chapter and begin with the Direction enumeration:
 
 enum Direction {
   case north
   case south
   case east
   case west
 }

 Imagine starting a new level in a video game.
 The character makes a series of movements in the game.
 Calculate the position of the character on a top-down level map after making a set of movements:
 
 let movements: [Direction] = [.north, .north, .west, .south,
   .west, .south, .south, .east, .east, .south, .east]

 Hint: Use a tuple for the location:
 
 var location = (x: 0, y: 0)
 */

enum Direction {
  case north
  case south
  case east
  case west
}

let movements: [Direction] = [.north, .north, .west, .south,
  .west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y: 0)

movements.forEach { move in
  switch move {
  case .north:
    location.y += 1
  case .south:
    location.y -= 1
  case .east:
    location.x += 1
  case .west:
    location.x -= 1
  }
}

let currentX = location.x
let currenY = location.y

//: [Next](@next)
