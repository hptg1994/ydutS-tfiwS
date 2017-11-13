import UIKit
//: # Basic Syntax
let three = 3
let pointOneFour = 0.14169

let pi = Double(three) + pointOneFour

/*:
 ### Optional Operation
 */

let number : Int? = 3
if number != nil {
    print("Ok it contains a val and it is \(number)")  //or it will output option 3
}
if number != nil {
    print("Ok it contains a val and it is \(number!)")  //or it will output option 3
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100{
    print("\(firstNumber)<\(secondNumber)<100")
}

let possibleString: String? = "An optional String."
print("So it will display option String: \(possibleString)")
let forcedString:String = possibleString!
print("So it not will display option:\(possibleString)")
let assumedString: String! = "An implicity unwrapped optional string."
let implicitString: String = assumedString
if assumedString != nil {
    print(assumedString)
}
if let definiteString = assumedString{
    print(definiteString)
}

/*:
 ### Range Operation
 - Note:So, **"..."** means include 5, **"..<"**µ  means not inclue 5
 */
for index in 1...5{
    print("\(index) times 5 is \(index * 5)")
}
for index in 1..<5{
    print("\(index) times 5 is \(index * 5)")
}

/*:
 ### String
 - Note:multiple String
 */

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

for character in "Dog!🐶" {
    print(character)
}

/*:
 ### Counting Character
 */
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// prints "unusualMenagerie has 40 characters"

/*:
 *****
 ## Collection Type(集合类型)
 - Note: Three Primary Type : **Array**, **Sets**, **Dictionary(Map)**
 ### 1.Array
 Array<Element>
 */
var someInt = [Int]() //真的是这样子的,要启动一个array只能这个样子,而不能var someInt:[Int] 这个样子，java: int[] array = new int[number], int[] array = {....}
var someInt4:[Int] = [] //也可以这样启动，要有初始启动项
print("OK so we initialize a Array with its size is \(someInt.count) number")
print("OK so we initialize a Array with its size is \(someInt4.count) number")
//print("OK so we initialize a Array with its size is \(someInt4.count) number")
//And now we can append a number into the someInt
someInt.append(3)
//we also can do this to initialize a Array
var threeDoubles = Array(repeating:0.0,count:3)
print(threeDoubles)
//And the concation of two Arrays
var anotherThreeeDubles = Array(repeating:2.5,count:3)
var sixDoubles = threeDoubles + anotherThreeeDubles
print(sixDoubles)
//: ### Modify The Array
//insert a new value among the array
var shoppingList = ["Eggs", "Milk"]
shoppingList.insert("Rice", at: 1)
print(shoppingList)
//same way to remove
shoppingList.remove(at: shoppingList.count-1)
print(shoppingList)
shoppingList.removeLast() // Obviously it remove the last one
//Iterate
shoppingList=["Eggs", "Milk"]
for(index,value) in shoppingList.enumerated(){  //use emumerated() to get the index and item of the array
    print("Item\(index + 1):\(value)")
}

//: ## Set
//initiate
var letters = Set<Character>()
var letters2 : Set<Character>
var numbers : Set = [1,2,3]
print(letters.count)
letters = ["A","B"]

//method:1.isEmpty 2.insert 3.remove
letters.insert("c")
letters.remove("B")

//four method to concate two set
var a : Set<Character> = ["A","B","C"]
var b : Set<Character> = ["D","E","C"]
//1.intersection
print(a.intersection(b))
//2.exclusiveOr
print(a.symmetricDifference(b))
//3.union
print(a.union(b))
//4.subtract a.subtract(b) 以a为主体，排除和b一样的部分
print(a.subtract(b))


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isStrictSubset(of: farmAnimals)
//true
houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

//: ## Dictionary
//initiate
var namesOfIntegers = [Int:String]()
//put value
namesOfIntegers[16] = "sixteen"
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//同样赋予新值
airports["LHR"] = "London Heathrow"
//updateValue  updateValue(_:forKey:)
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
    // prints "The old value for DUB was Dublin."
}
//if it not exist,it will create one in it
airports.updateValue("Baiyun Airport", forKey: "CAN")
print(airports)
//iterator
for(airportCode,airportName) in airports{
    print("\(airportCode): \(airportName)")
}
//key and value
let airportCode = [String](airports.keys)
//let airportCode2 : [String] = airports.keys  这个是错误的
let airportCode2 : [String] = [String](airports.keys) // 这样子是可以的，因为airports.key 返回的是Dictionary[String], 不是String，所以要强制转换为String，通过[String]()
print(airportCode)
let airportName = [String](airports.values)
print(airportName)



