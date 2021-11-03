//: [Previous](@previous)

import Foundation

// Chapter 9: Strings

/*
 Challenge 1: Character count
 
 Write a function that takes a string and prints out the count of each character in the string.
 For bonus points, print them ordered by the count of each character.
 For bonus-bonus points, print it as a nice histogram.
 
 Hint: You could use # characters to draw the bars.
 */

func printCharacterCount(text: String) {
  guard text.count > 0 else {
    return
  }
  
  var counts: [Character: Int] = [:]
  
  for letter in text {
    counts[letter, default: 0] += 1
  }
  
  let sortedKeys = counts.keys.sorted() {
    counts[$0]! > counts[$1]!
  }
  
  let max = counts[sortedKeys.first!]!
  
  for key in sortedKeys {
    let hashSize = (counts[key]! * 40) / max
    print("\(key) : \(String(repeating: "#", count: hashSize)) \(counts[key]!)")
  }
}

printCharacterCount(text: "Write a function that takes a string and prints out the count of each character in the string.")

/*
 Challenge 2: Word count
 
 Write a function that tells you how many words there are in a string. Do it without splitting the string.
 
 Hint: try iterating through the string yourself.
 */

func wordCount(text: String) -> Int {
  var count = 0
  var isWord = false
  
  for letter in text {
    if letter == " " {
      if isWord {
        count += 1
        isWord = false
      }
    } else {
      isWord = true
    }
  }
  
  if isWord {
    count += 1
  }
  
  return count
}

wordCount(text: "Hint: try iterating through the string yourself.")

/*
 Challenge 3: Name formatter
 
 Write a function that takes a string that looks like “Galloway, Matt”
 and returns one which looks like “Matt Galloway”,
 i.e., the string goes from "<LAST_NAME>, <FIRST_NAME>" to "<FIRST_NAME> <LAST_NAME>".
 */

func sanitized(for fullName: String) -> String? {
  guard let comaIndex = fullName.firstIndex(of: ",") else {
    return nil
  }
  
  let lastName = fullName[..<comaIndex]
  let firstName = fullName[comaIndex...].dropFirst(2)
  return "\(firstName) \(lastName)"
}

if let sanitizedName = sanitized(for: "Zadkowski, Grzegorz") {
  print(sanitizedName)
}

/*
 Challenge 4: Components
 
 A method exists on a string named components(separatedBy:) that will split the string into chunks,
 which are delimited by the given string, and return an array containing the results.
 
 Your challenge is to implement this yourself.
 
 Hint: There exists a view on String named indices that lets you iterate
 through all the indices (of type String.Index) in the string.
 You will need to use this.
 */

func splitted(_ text: String, delimiter: Character) -> [String] {
  var words: [String] = []
  var lastWordIndex = text.startIndex
  
  
  for i in text.indices {
    if text[i] == delimiter {
      let substring = text[lastWordIndex..<i]
      words.append(String(substring))
      lastWordIndex = text.index(after: i)
    }
  }
  
  words.append(String(text[lastWordIndex...]))
  
  return words
}

splitted("cat-dog-pig", delimiter: "-")

/*
 Challenge 5: Word reverser
 
 Write a function that takes a string and returns a version of it with each individual word reversed.
 
 For example, if the string is “My dog is called Rover” then the resulting string would be “yM god si dellac revoR”.
 
 Try to do it by iterating through the indices of the string until you find a space and then reversing what was before it.
 Build up the result string by continually doing that as you iterate through the string.
 
 Hint: You’ll need to do a similar thing as you did for Challenge 4 but reverse the word each time.
 Try to explain to yourself, or the closest unsuspecting family member,
 why this is better in terms of memory usage than using the function you created in the previous challenge.
 */

func wordsReverse(in text: String) -> String {
  var reversed = ""
  var lastWordIndex = text.startIndex
  
  for i in text.indices {
    if text[i] == " " {
      reversed += text[lastWordIndex..<i].reversed() + " "
      lastWordIndex = text.index(after: i)
    }
  }
  
  reversed += text[lastWordIndex...].reversed()
  
  return reversed
}

wordsReverse(in: "Kilka wyrazów do odwrócenia")
//: [Next](@next)
