//: [Previous](@previous)

import Foundation

// Chapter 16: Protocols

/*
 Challenge 1: Pet shop tasks
 
 Create a collection of protocols for tasks at a pet shop with dogs, cats, fish and birds.
 
 The pet shop duties include these tasks:
 
 - All pets need to be fed.
 - Pets that can fly need to be caged.
 - Pets that can swim need to be put in a tank.
 - Pets that walk need exercise.
 - Tanks and cages need to be cleaned occasionally.
 
 1. Create classes or structs for each animal and adopt the appropriate protocols.
    Feel free to simply use a print() statement for the method implementations.
 2. Create homogeneous arrays for animals that need to be fed, caged, cleaned, walked, and tanked.
    Add the appropriate animals to these arrays.
    The arrays should be declared using the protocol as the element type, for example, var caged: [Cageable]
 3. Write a loop that will perform the proper tasks (such as feed, cage, walk) on each element of each array.
 */

protocol Feedable {
  func feed()
}

protocol Cleanable {
  func clean()
}

protocol Cageable: Cleanable {
  func cage()
}

protocol Tankable: Cleanable {
  func tank()
}

protocol Walkable {
  func walk()
}

class Dog: Feedable, Walkable {
  func feed() {
    print("Dog has been feeded.")
  }
  
  func walk() {
    print("Go for a walk.")
  }
}

class Cat: Feedable, Cleanable {
  func feed() {
    print("Cat has been feeded,")
  }
  
  func clean() {
    print("Litter box is cleanned.")
  }
}

class Fish: Feedable, Tankable {
  func feed() {
    print("Fish has been feeded.")
  }
  
  func tank() {
    print("Fish has been tanked.")
  }
  
  func clean() {
    print("Fish tank has been cleanned.")
  }
}

class Bird: Feedable, Cageable {
  func feed() {
    print("Bird has been feeded.")
  }
  
  func cage() {
    print("Bird in a cage.")
  }
  
  func clean() {
    print("Cage is cleanned")
  }
}

let dog = Dog()
let cat = Cat()
let fish = Fish()
let bird = Bird()

let walkingDuties: [Walkable] = [dog]
let feedingDuities: [Feedable] = [dog, cat, fish, bird]
let cleaningDuties: [Cleanable] = [cat, fish, bird]
let tankingDuties: [Tankable] = [fish]
let cagingDuties: [Cageable] = [bird]

for walkable in walkingDuties {
  walkable.walk()
}

for feedable in feedingDuities {
  feedable.feed()
}

for cleanable in cleaningDuties {
  cleanable.clean()
}

for tankable in tankingDuties {
  tankable.tank()
}

for cageable in cagingDuties {
  cageable.cage()
}
//: [Next](@next)
