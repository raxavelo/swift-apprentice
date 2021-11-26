//: [Previous](@previous)

import Foundation

// Chapter 21: Pattern Matching

/*
 Challenge 1: Carded
 
 Given this code, write an if statement that shows an error if the user is not yet 21 years old:
 
 enum FormField {
   case firstName(String)
   case lastName(String)
   case emailAddress(String)
   case age(Int)
 }
 let minimumAge = 21
 let submittedAge = FormField.age(22)
 */

enum FormField {
  case firstName(String)
  case lastName(String)
  case emailAddress(String)
  case age(Int)
}
let minimumAge = 21
let submittedAge = FormField.age(22)

if case .age(let age) = submittedAge, age >= minimumAge {
  print("Welcome!")
} else {
  print("You are too young.")
}

/*
 Challenge 2: Planets with liquid water
 
 Given this code, find the planets with liquid water using a for loop:
 
 enum CelestialBody {
   case star
   case planet(liquidWater: Bool)
   case comet
 }

 let telescopeCensus = [
   CelestialBody.star,
   .planet(liquidWater: false),
   .planet(liquidWater: true),
   .planet(liquidWater: true),
   .comet
 ]
 */

enum CelestialBody {
  case star
  case planet(liquidWater: Bool)
  case comet
}

let telescopeCensus = [
  CelestialBody.star,
  .planet(liquidWater: false),
  .planet(liquidWater: true),
  .planet(liquidWater: true),
  .comet
]

for case .planet(let liquidWater) in telescopeCensus where liquidWater {
  print("I found a planet with liquid water!")
}

/*
 Challenge 3: Find the year
 
 Given this code, find the albums that were released in 1974 with a for loop:
 
 let queenAlbums = [
   ("A Night at the Opera", 1974),
   ("Sheer Heart Attack", 1974),
   ("Jazz", 1978),
   ("The Game", 1980)
 ]
 */

let queenAlbums = [
  ("A Night at the Opera", 1974),
  ("Sheer Heart Attack", 1974),
  ("Jazz", 1978),
  ("The Game", 1980)
]

for case let (album, 1974) in queenAlbums {
  print(album)
}

/*
 Challenge 4: Where in the world
 
 Given the following code, write a switch statement that will print out whether
 the monument is located in the northern hemisphere, the southern hemisphere, or on the equator.
 
 let coordinates = (lat: 37.334890, long: -122.009000)
 */

let coordinates = (lat: 37.334890, long: -122.009000)

switch coordinates {
case (let lat, _) where lat > 0:
  print("northern hemisphere")
case (let lat, _) where lat < 0:
  print("southern hemisphere")
case (0, _):
  print("equator")
default:
  break
}

//: [Next](@next)
