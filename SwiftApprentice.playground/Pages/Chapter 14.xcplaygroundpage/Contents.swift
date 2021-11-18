//: [Previous](@previous)

import Foundation

// Chapter 14: Advanced Classes

/*
 Challenge 1: Initialization order
 
 Create three simple classes called A, B, and C where C inherits from B and B inherits from A.
 In each class initializer, call print("I’m <X>!") both before and after super.init().
 Create an instance of C called c.
 What order do you see each print() called in?
 */

/*
 Challenge 2: Deinitialization order
 
 Implement deinit for each class.
 Create your instance c inside of a do { } scope, causing the reference count to go to zero when it exits the scope.
 Which order do the classes deinitialize?
 */

class A {
  init() {
    print("I'm A! (1)")
  }
  
  deinit {
    print("A destroyed!")
  }
}

class B: A {
  override init() {
    print("I'm B! (1)")
    super.init()
    print("I'm B! (2)")
  }
  
  deinit {
    print("B destroyed!")
  }
}

class C: B {
  override init() {
    print("I'm C! (1)")
    super.init()
    print("I'm C! (2)")
  }
  
  deinit {
    print("C destroyed")
  }
}

do {
  let _ = C()
}

/*
 Challenge 3: Type casting
 
 Cast the instance of type C to an instance of type A. Which casting operation do you use and why?
 */

do {
  let c = C()
  let _ = c as A // A is a superclass for C so I can use "as".
}

/*
 Challenge 4: To subclass or not
 
 Create a subclass of StudentAthlete called StudentBaseballPlayer
 and include properties for position, number, and battingAverage.
 What are the benefits and drawbacks of subclassing StudentAthlete in this scenario?
 */

class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

struct Grade {
  let letter: String
  let points: Double
}

class Student: Person {
  var grades: [Grade] = []
}

class StudentAthelete: Student {
  var sports: [String] = []
}

class StudentBaseballPlayer: StudentAthelete {
  var position: String
  var number: Int
  var battingAverage: Double = 0.0
  
  init(firstName: String, lastName: String, position: String, number: Int){
    self.position = position
    self.number = number
    super.init(firstName: firstName, lastName: lastName)
  }
}

/*
 Benefits:
  - StudentBaseballPlayer automatically has properties like firstName, lastName, grades.
 
 Drawbacks:
  - What if StudentBaseballPlayer will be a professional player in the future, but no more a student?
 */

//: [Next](@next)
