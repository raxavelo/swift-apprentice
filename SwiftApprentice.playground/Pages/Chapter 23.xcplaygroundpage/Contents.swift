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

struct Spaceship: Codable {
  var name: String
  var crew: [CrewMember]
}

struct CrewMember: Codable {
  var name: String
  var race: String
}

/*
 Challenge 2: Custom keys
 
 It appears that the spaceship’s interface is different than that of the outpost on Mars.
 The Mars outpost expects to get the spaceship’s name as spaceship_name.
 Make the necessary modifications so that encoding the structure would return the JSON in the correct format.
 */

extension Spaceship {
  enum CodingKeys: String, CodingKey {
    case name = "spaceship_name"
    case crew
  }
}

/*
 Challenge 3: Write a decoder
 
 You received a transmission from planet Earth about a new spaceship.
 Write a custom decoder to convert this JSON into a Spaceship.
 This is the incoming transmission:
 
 {"spaceship_name":"USS Enterprise", "captain":{"name":"Spock", "race":"Human"}, "officer":{"name": "Worf", "race":"Klingon"}}

 Hint: There are no ranks in your type, just an array of crew members,
 so you’ll need to use different keys for encoding and decoding.
 */

extension Spaceship {
  enum CrewKeys: String, CodingKey {
    case captain
    case officer
  }
}

extension Spaceship {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decode(String.self, forKey: .name)
    let crewValues = try decoder.container(keyedBy: CrewKeys.self)
    let captain = try crewValues.decodeIfPresent(CrewMember.self, forKey: .captain)
    let officer = try crewValues.decodeIfPresent(CrewMember.self, forKey: .officer)
    crew = [captain, officer].compactMap() { $0 }
  }
}

let transmission = "{\"spaceship_name\":\"USS Enterprise\", \"captain\":{\"name\":\"Spock\", \"race\":\"Human\"}, \"officer\":{\"name\": \"Worf\", \"race\":\"Klingon\"}}"

let enterprise = try JSONDecoder().decode(Spaceship.self, from: transmission.data(using: .utf8)!)
print(enterprise)

/*
 Challenge 4: Decoding property lists
 
 You intercepted some weird transmissions from the Klingon, which you can’t decode.
 Your scientists deduced that these transmissions are encoded with a PropertyListEncoder
 and that they’re also information about spaceships.
 Try your luck with decoding this message:
 
 var klingonSpaceship = Spaceship(name: "IKS NEGH’VAR", crew: [])
 let klingonMessage = try PropertyListEncoder().encode(klingonSpaceship)
 */

var klingonSpaceship = Spaceship(name: "IKS NEGH’VAR", crew: [])
let klingonMessage = try PropertyListEncoder().encode(klingonSpaceship)
let decodedMessage = try PropertyListDecoder().decode(Spaceship.self, from: klingonMessage)

print(decodedMessage)

/*
 Challenge 5: Enumeration with associated values
 
 The compiler can (as of Swift 5.5) automatically generate codable for enumerations with associated values.
 Check out how it works by encoding and printing out the following list of items.
 
 enum Item {
   case message(String)
   case numbers([Int])
   case mixed(String, [Int])
   case person(name: String)
 }

 let items: [Item] = [.message("Hi"),
                      .mixed("Things", [1,2]),
                      .person(name: "Kirk"),
                      .message("Bye")]
 */

enum Item {
  case message(String)
  case numbers([Int])
  case mixed(String, [Int])
  case person(name: String)
}

let items: [Item] = [.message("Hi"),
                     .mixed("Things", [1,2]),
                     .person(name: "Kirk"),
                     .message("Bye")]

extension Item: Codable {}

let encodedItems = try JSONEncoder().encode(items)
print(String(data: encodedItems, encoding: .utf8)!)

//: [Next](@next)
