//: [Previous](@previous)

import Cocoa

// Chapter 1: Expresions, Variables & Constants

/*
 Challenge 1: Variables
 
 Declare a constant Int called myAge and set it equal to your age.
 Also declare an Int variable called dogs and set it equal to the number of dogs you own.
 Then imagine you bought a new puppy and increment the dogs variable by one.
 */

let myAge: Int = 30
var dogs: Int = 3
dogs += 1

/*
 Challenge 2: Make it compile
 
 Given the fallowing code:
 
 age: Int = 16
 print(age)
 age = 30
 print(age)
 
 Modify the first line so that it compiles. Did you use var or let?
 */

var age: Int = 16
print(age)
age = 30
print(age)

/*
 Challenge 3: Compute the answer
 
 Consider the following code:
 
 let x: Int = 46
 let y: Int = 10

 Work out what answer equals when you add the following lines of code:
 
 // 1
 let answer1: Int = (x * 100) + y
 // 2
 let answer2: Int = (x * 100) + (y * 100)
 // 3
 let answer3: Int = (x * 100) + (y / 10)

 
 My answers:
 answer1 == 4610
 answer2 == 5600
 answer3 == 4601
 */

/*
 Challenge 4: Add parentheses
 
 Add as many parentheses to the following calculation, ensuring that it doesn’t change the result of the calculation.
 
 8 - 4 * 2 + 6 / 3 * 4
 */

((8 - (4 * 2)) + ((6 / 3) * 4))

/*
 Challenge 5: Average rating
 
 Declare three constants called rating1, rating2 and rating3 of type Double and assign each a value.
 Calculate the average of the three and store the result in a constant named averageRating.
 */

let rating1: Double = 4.5
let rating2: Double = 3.0
let rating3: Double = 5.0

let averageRating: Double = (rating1 + rating2 + rating3) / 3

/*
 Challenge 6: Electrical power
 
 The power of an electrical appliance is calculated by multiplying the voltage by the current.
 Declare a constant named voltage of type Double and assign it a value.
 Then declare a constant called current of type Double and assign it a value.
 Finally calculate the power of the electrical appliance you’ve just created
 storing it in a constant called power of type Double.
 */

let voltage: Double = 230.0
let current: Double = 16.0
let power: Double = voltage * current

/*
 Challenge 7: Electrical resistance
 
 The resistance of such an appliance can then be calculated (in a long-winded way)
 as the power divided by the current squared.
 Calculate the resistance and store it in a constant called resistance of type Double.
 */

let resistance: Double = power / pow(current, 2.0)

/*
 Challenge 8: Random integer
 
 You can create a random integer number by using the function arc4random().
 This picks a number anywhere between 0 and 4294967295.
 You can use the modulo operator to truncate this random number to whatever range you want.
 Declare a constant randomNumber and assign it a random number generated with arc4random().
 Then calculate a constant called diceRoll and use the random number you just found
 to create a random number between 1 and 6.
 
 (Hint: You will need to include the line import Foundation to get access to arc4random().
 If this method of creating a random number seems primative, you are right!
 There is an easier, more clear and expressive way to generate random numbers
 you will learn about in Chapter 4.)
 */

let randomNumber: Int = Int(arc4random())
let diceRoll: Int = randomNumber % 6 + 1

/*
 Challenge 9: Quadratic equations
 
 A quadratic equation is something of the form a⋅x² + b⋅x + c = 0.
 The values of x which satisfy this can be solved by using the equation x = (-b ± sqrt(b² - 4⋅a⋅c)) / (2⋅a).
 Declare three constants named a, b and c of type Double.
 Then calculate the two values for x using the equation above
 (noting that the ± means plus or minus — so one value of x for each).
 Store the results in constants called root1 and root2 of type Double.
 */

let a: Double = 2.0
let b: Double = -1.5
let c: Double = -5.0

let delta: Double = sqrt(pow(b, 2.0) - 4.0 * a * c)

let root1: Double = (-b - delta) / (2.0 * a)
let root2: Double = (-b + delta) / (2.0 * a)


//: [Next](@next)
