//: [Previous](@previous)

import Foundation

// Chapter 13: Classes

/*
 Challenge 1: Movie lists
 
 Imagine you’re writing a movie-viewing app in Swift.
 Users can create lists of movies and share those lists with other users.
 Create a User and a List class that uses reference semantics to help maintain lists between users.
 
 User: Has a method addList(_:) that adds the given list to
 a dictionary of List objects (using the name as a key),
 and list(forName:) -> List? that returns the List for the provided name.
 
 List: Contains a name and an array of movie titles.
 A print method will print all the movies in the list.
 
 Create jane and john users and have them create and share lists.
 Have both jane and john modify the same list and call print from both users.
 Are all the changes reflected?
 
 What happens when you implement the same with structs?
 What problems do you run into?
 */

class User {
  var lists: [String: List] = [:]
  
  func addList(_ list: List) {
    lists[list.name] = list
  }
  
  func list(forName name: String) -> List? {
    lists[name]
  }
}

class List {
  let name: String
  var movies: [String] = []
  
  init(name: String) {
    self.name = name
  }
  
  func print() {
    Swift.print("Movie List: \(name)")
    for movie in movies {
      Swift.print(movie)
    }
    Swift.print("\n")
  }
}

let jane = User()
let john = User()
var actionList = List(name: "Action")

jane.addList(actionList)
john.addList(actionList)

jane.lists["Action"]?.movies.append("Walking to Remember")
jane.lists["Action"]?.movies.append("Forest Gump")

john.lists["Action"]?.movies.append("Up!")

jane.lists["Action"]?.print()
john.lists["Action"]?.print()

// If List will be implemented as struct, jane and john get copy of Action list,
// and they will have separated lists of Action movies.

/*
 Challenge 2: T-shirt store
 
 Your challenge here is to build a set of objects to support a T-shirt store.
 Decide if each object should be a class or a struct and why.
 
 TShirt: Represents a shirt style you can buy. Each TShirt has a size, color, price, and an optional image on the front.
 
 User: A registered user of the t-shirt store app. A user has a name, email, and a ShoppingCart (see below).
 
 Address: Represents a shipping address and contains the name, street, city, and zip code.
 
 ShoppingCart: Holds a current order, which is composed of an array of TShirt that the User wants to buy,
 as well as a method to calculate the total cost.
 Additionally, there is an Address that represents where the order will be shipped.
 
 My answer:
  TShirt should be a structure, because represents only a view of T-Shirt not real object.
  User should be a class, because represents real person. Every User is unique.
  Address - for this structure is enough.
  ShoppingCart - I would to implement this as class. It represents a real object.
 */

//: [Next](@next)
