//: [Previous](@previous)

import Foundation

// Chapter 18: Access Control, Code Organization & Testing

/*
 Challenge 1: Singleton pattern
 
 A singleton is a design pattern that restricts the instantiation of a class to one object.
 
 Use access modifiers to create a singleton class Logger.
 This Logger should:
 
  - Provide shared, public, global access to the single Logger object.
  - Not be able to be instantiated by consuming code.
  - Have a method log() that will print a string to the console.
 */

class Logger {
  private init() {}
  
  static let sharedInstance = Logger()
  
  func log(_ text: String) {
    print(text)
  }
}

let logger = Logger.sharedInstance
logger.log("Hey Swift!")

/*
 Challenge 2: Stack
 
 Declare a generic type Stack.
 A stack is a LIFO (last-in-first-out) data structure that supports the following operations:
 
  - peek: returns the top element on the stack without removing it. Returns nil if the stack is empty.
  - push: adds an element on top of the stack.
  - pop: returns and removes the top element on the stack. Returns nil if the stack is empty.
  - count: returns the size of the stack.
 
 Ensure that these operations are the only exposed interface.
 In other words, additional properties or methods needed to implement the type should not be visible.
 */

struct Stack<Element> {
  private var elements: [Element] = []
  
  var count: Int {
    elements.count
  }
  
  func peek() -> Element? {
    elements.last
  }
  
  mutating func pop() -> Element? {
    if elements.isEmpty {
      return nil
    }
    return elements.removeLast()
  }
  
  mutating func push(_ element: Element) {
    elements.append(element)
  }
}

/*
 Challenge 3: Character battle
 
 Utilize something called a static factory method to create a game of Wizards vs. Elves vs. Giants.
 
 Add a file Characters.swift in the Sources folder of your playground.
 
 To begin:
 
  - Create an enum GameCharacterType that defines values for elf, giant and wizard.
  - Create a protocol GameCharacter that inherits from AnyObject and has properties name, hitPoints and attackPoints.
    Implement this protocol for every character type.
  - Create a struct GameCharacterFactory with a single static method make(ofType: GameCharacterType) -> GameCharacter.
  - Create a global function battle that pits two characters against each other — with the first character striking first!
    If a character reaches 0 hit points, they have lost.
 
 Hints:
 
  - The playground should not be able to see the concrete types that implement GameCharacter.
  - Elves have 3 hit points and 10 attack points.
    Wizards have 5 hit points and 5 attack points.
    Giants have 10 hit points and 3 attack points.
  - The playground should know none of the above!
 
 In your playground, you should use the following scenario as a test case:
 
 let elf = GameCharacterFactory.make(ofType: .elf)
 let giant = GameCharacterFactory.make(ofType: .giant)
 let wizard = GameCharacterFactory.make(ofType: .wizard)

 battle(elf, vs: giant) // Giant defeated!
 battle(wizard, vs: giant) // Giant defeated!
 battle(wizard, vs: elf) // Elf defeated!

 */

let elf = GameCharacterFactory.make(ofType: .elf)
let giant = GameCharacterFactory.make(ofType: .giant)
let wizard = GameCharacterFactory.make(ofType: .wizard)

battle(elf, vs: giant) // Giant defeated!
battle(wizard, vs: giant) // Giant defeated!
battle(wizard, vs: elf) // Elf defeated
battle(wizard, vs: elf) // Elf is already defeated.
battle(wizard, vs: wizard) // Wizard can't fight with himself. :P
battle(elf, vs: wizard) // Elf is dead. He can't fight.

//: [Next](@next)
