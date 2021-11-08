//: [Previous](@previous)

import Foundation

// Chapter 10: Structures

/*
 Challenge 1: Fruit tree farm
 
 Imagine you’re at a fruit tree farm, and you grow different kinds of fruits: pears, apples, and oranges.
 After the fruits are picked, a truck brings them in to be processed at the central facility.
 Since the fruits are all mixed together on the truck,
 the workers in the central facility have to sort them into the correct inventory container one by one.
 
 Implement an algorithm that receives a truck full of different kinds of fruits and places
 each fruit into the correct inventory container.
 
 Keep track of the total weight of fruit processed by the facility and print out how many of each fruit is in the inventory.
 */

struct Fruit {
  let kind: String
  let weight: Int
}

let track: [Fruit] = [
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Orange", weight: Int.random(in: 70...100)),
  Fruit(kind: "Apple", weight: Int.random(in: 70...100)),
  Fruit(kind: "Pear", weight: Int.random(in: 70...100))
]

var apples = [Fruit]()
var pears: [Fruit] = []
var oranges = [Fruit]()

var totalProcessedWeight = 0

func receive(_ track: [Fruit]){
  track.forEach { fruit in
    switch fruit.kind {
    case "Apple":
      apples.append(fruit)
    case "Pear":
      pears.append(fruit)
    case "Orange":
      oranges.append(fruit)
    default:
      fatalError("Fruit not supported!")
    }
    
    totalProcessedWeight += fruit.weight
  }
}

receive(track)

print("Total weight:", totalProcessedWeight, "grams", "\n---")
print("Quantity of pears:\t\t", pears.count)
print("Quantity of apples:\t\t", apples.count)
print("Quantity of oranges:\t", oranges.count, "\n")


/*
 Challenge 2: A T-shirt model
 
 Create a T-shirt structure that has size, color and material options.
 Provide a method to calculate the cost of a shirt based on its attributes.
 */

typealias Size = String
let small: Size = "Small"
let medium: Size = "Medium"
let large: Size = "Large"
let xlarge: Size = "XLarge"

typealias Material = String
let cotton: Material = "Cotton"
let polyester: Material = "Polyester"
let wool: Material = "Wool"

typealias Color = String

struct TShirt {
  let size: Size
  let material: Material
  let color: Color
  
  func cost() -> Double {
    let basePrice = 10.0
    
    let sizeMultiplier: Double
    switch size {
    case small, medium:
      sizeMultiplier = 1.0
    case large, xlarge:
      sizeMultiplier = 1.1
    default:
      sizeMultiplier = 1.2
    }
    
    let materialMultiplier: Double
    switch material {
    case cotton:
      materialMultiplier = 1.0
    case polyester:
      materialMultiplier = 1.2
    case wool:
      materialMultiplier = 1.4
    default:
      materialMultiplier = 2.0
    }
    
    return basePrice * sizeMultiplier * materialMultiplier
  }
}

TShirt(size: medium, material: wool, color: "Black").cost()
TShirt(size: xlarge, material: polyester, color: "White").cost()

/*
 Challenge 3: Battleship
 
 Write the engine for a Battleship-like game.
 If you aren’t familiar with Battleship, you can brush up on the details at this webpage:
 http://bit.ly/2nT3JBU
 
 Use an (x, y) coordinate system for your locations modeled using a structure.
 
 Ships should also be modeled with structures.
 Record an origin, direction and length.
 
 Each ship should be able to report if a “shot” has resulted in a “hit”.
 */

struct Coordinate {
  let x: Int
  let y: Int
}

struct Ship {
  let position: Coordinate
  let direction: String
  let length: Int
  
  func isHit(coordinate: Coordinate) -> Bool {
    if direction == "Right" {
      return coordinate.y == position.y &&
              coordinate.x >= position.x &&
              coordinate.x - position.x < length
    } else {
      return coordinate.x == position.x &&
              coordinate.y >= position.y &&
              coordinate.y - position.y < length
    }
  }
}

struct Board {
  var ships: [Ship] = []
  
  func fire(location: Coordinate) -> Bool {
    for ship in ships {
      if ship.isHit(coordinate: location) {
        print("Hit!")
        return true
      }
    }
    return false
  }
}

let patrolBoat = Ship(position: Coordinate(x: 2, y: 2), direction: "Right", length: 2)
let battleship = Ship(position: Coordinate(x: 5, y: 3), direction: "Down", length: 4)
let submarine = Ship(position: Coordinate(x: 0, y: 0), direction: "Down", length: 3)

var board = Board()
board.ships.append(contentsOf: [submarine, patrolBoat, battleship])

board.fire(location: Coordinate(x: 2, y: 2))
board.fire(location: Coordinate(x: 2, y: 3))
board.fire(location: Coordinate(x: 5, y: 6))
board.fire(location: Coordinate(x: 5, y: 7))
//: [Next](@next)
