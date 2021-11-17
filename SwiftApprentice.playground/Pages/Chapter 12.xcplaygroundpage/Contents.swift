//: [Previous](@previous)

import Foundation

// Chapter 12: Methods

/*
 Challenge 1: Grow a Circle
 
 Given the Circle structure below:
 
 struct Circle {
   
   var radius = 0.0

   var area: Double {
     .pi * radius * radius
   }

 }
 
 Write a method that can change an instance’s area by a growth factor.
 For example, if you call circle.grow(byFactor: 3), the area of the instance will triple.
 
 Hint: Add a setter to area.
 */

struct Circle {
  
  var radius = 0.0

  var area: Double {
    get {
      .pi * radius * radius
    }
    set {
      radius = (newValue / .pi).squareRoot()
    }
  }

  mutating func grow(byFactor factor: Double) {
    area *= factor
  }
}

var circle = Circle(radius: 10.0)
circle.area
circle.radius
circle.grow(byFactor: 2)
circle.area
circle.radius

/*
 Challenge 2: A more advanced advance()
 
 Here is a naïve way of writing advance() for the SimpleDate structure you saw earlier in the chapter:
 
 let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

 struct SimpleDate {
  var month: String
  var day: Int

  mutating func advance() {
    day += 1
  }
 }

 var date = SimpleDate(month: "December", day: 31)
 date.advance()
 date.month // December; should be January!
 date.day // 32; should be 1!

 What happens when the function should go from the end of one month to the start of the next?
 Rewrite advance() to account for advancing from December 31st to January 1st.
 */

let months = ["January", "February", "March",
             "April", "May", "June",
             "July", "August", "September",
             "October", "November", "December"]

struct SimpleDate {
  var month: String
  var day: Int
  
  var totalDaysInCurrentMonth: Int {
    switch month {
    case "January", "March", "May", "July", "August", "October", "December":
      return 31
    case "February":
      return 28
    case "April", "June", "September", "November":
      return 30
    default:
      return 0
    }
  }
  
  mutating func advance() {
    if day == totalDaysInCurrentMonth {
      if month == "December" {
        month = "January"
      } else {
        month = months[months.firstIndex(of: month)! + 1]
      }
      day = 1
    } else {
      day += 1
    }
  }
}

var date = SimpleDate(month: "December", day: 31)
date.advance()
date.month
date.day

/*
 Challenge 3: Odd and Even Math
 
 Add type methods named isEven and isOdd to your Math namespace
 that return true if a number is even or odd, respectively.
 */

struct Math {}

extension Math {
  static func isEven(_ value: Int) -> Bool {
    value % 2 == 0
  }
  
  static func isOdd(_ value: Int) -> Bool {
    value % 2 == 1
  }
}

Math.isOdd(20)
Math.isOdd(21)
Math.isEven(20)
Math.isEven(21)

/*
 Challenge 4: Odd and Even Int
 
 It turns out that Int is simply a struct.
 Add the computed properties isEven and isOdd to Int using an extension.
 
 Note: Generally, you want to be careful about what functionality you add
 to standard library types as it can confuse readers.
 */

extension Int {
  var isEven: Bool {
    self % 2 == 0
  }
  
  var isOdd: Bool {
    self % 2 == 1
  }
}

20.isEven
21.isEven
20.isOdd
21.isOdd

/*
 Challenge 5:
 
 Add the method primeFactors() to Int.
 Since this is an expensive operation, this is best left as an actual method and not a computed property.
 */

extension Int {
  func primeFactors() -> [Int] {
    var remainingValue = self
    var testFactor = 2
    var primes = [Int]()
    
    while testFactor * testFactor <= remainingValue {
      if remainingValue % testFactor == 0 {
        primes.append(testFactor)
        remainingValue /= testFactor
      } else {
        testFactor += 1
      }
    }
    
    if remainingValue > 1 {
      primes.append(remainingValue)
    }
    return primes
  }
}

81.primeFactors()
20.primeFactors()

//: [Next](@next)
