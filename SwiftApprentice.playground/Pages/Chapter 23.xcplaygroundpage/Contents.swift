//: [Previous](@previous)

import Foundation

// Chapter 23: Encoding & Decoding Types

/*
 Challenge 1: Spaceship
 
 Given the structures below, make the necessary modifications to make Spaceship codable:
 
 struct Spaceship {
   var name: String
   var crew: [CrewMember]
 }

 struct CrewMember {
   var name: String
   var race: String
 }
 */

struct Spaceship Codable{
  var name: String
  var crew: [CrewMember]
}

struct CrewMember: Codable {
  var name: String
  var race: String
}
//: [Next](@next)
