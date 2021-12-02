//: [Previous](@previous)

import Foundation

// Chapter 24: Memory Management

/*
 Challenge 1: Break the cycle
 
 Break the strong reference cycle in the following code:
 
 class Person {
   let name: String
   let email: String
   var car: Car?

   init(name: String, email: String) {
     self.name = name
     self.email = email
   }

   deinit {
     print("Goodbye \(name)!")
   }
 }

 class Car {
   let id: Int
   let type: String
   var owner: Person?

  init(id: Int, type: String) {
    self.id = id
    self.type = type
  }

  deinit {
    print("Goodbye \(type)!")
  }
 }

 var owner: Person? = Person(name: "Cosmin",
                             email: "cosmin@whatever.com")
 var car: Car? = Car(id: 10, type: "BMW")

 owner?.car = car
 car?.owner = owner

 owner = nil
 car = nil
 */

class Person {
  let name: String
  let email: String
  weak var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  unowned var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil


//: [Next](@next)
