//: [Previous](@previous)

import Foundation

// Chapter 11: Properties

/*
 Challenge 1: Ice Cream
 
 Rewrite the IceCream structure below to use default values and lazy initialization:
 
 struct IceCream {
   let name: String
   let ingredients: [String]
 }

 1. Use default values for the properties.
 2. Lazily initialize the ingredients array.
 */

struct IceCream {
  var name: String = "Orange"
  lazy var ingredients: [String] = {
    ["milk", "ice", "orange juice"]
  } ()
}

var iceCream = IceCream()

iceCream.ingredients.append("clementine juice")

/*
 Challenge 2: Car and Fuel Tank
 
 At the beginning of the chapter, you saw a Car structure.
 Dive into the inner workings of the car
 and rewrite the FuelTank structure below with property observer functionality:
 
 struct FuelTank {
   var level: Double // decimal percentage between 0 and 1
 }

 1. Add a lowFuel stored property of Boolean type to the structure.
 2. Flip the lowFuel Boolean when the level drops below 10%.
 3. Ensure that when the tank fills back up, the lowFuel warning will turn off.
 4. Set the level to a minimum of 0 or a maximum of 1 if it gets set above or below the expected values.
 5. Add a FuelTank property to Car.
 */

struct FuelTank {
  var level: Double {
    didSet {
      if level < 0.0 {
        level = 0.0
      }
      if level > 1.0 {
        level = 1.0
      }
    }
  } // decimal percentage between 0 and 1
  var lowFuel: Bool {
    level < 0.1
  }
}

struct Car {
  let make: String
  let color: String
  var tank: FuelTank
}

var myCar = Car(make: "Maluch", color: "Red", tank: FuelTank(level: 0.5))

myCar.tank.lowFuel
myCar.tank.level = -1.2
myCar.tank.level
myCar.tank.lowFuel
myCar.tank.level = 2.3
myCar.tank.level
myCar.tank.lowFuel
//: [Next](@next)
