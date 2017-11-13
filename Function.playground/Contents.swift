import UIKit
//: ## Function
func greet(person:String) -> String{
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Pintaigao He"))

//: the return value of function can be ignored when it is call:
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but does not return a value

//: Functions with multiple return values
func minMax(array : [Int]) -> (min: Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8,-6,2,109,3,71])
print("min is \(bounds.min) and max is \(bounds.max)")
//: Optional Tuple Return Value  然后我发现只要是涉及 optional value的condition条件一般要用 if let ...
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax2(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
/*:
 ### 指定实际参数标签 Specifying Argument Label
 - Note:Write an argument label before the parameter name, seperated by a space:
    **The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent.**
 */


func greet2(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet2(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."

//: ### Funciton Types and Using Function Types
//Base:
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
//这个的意思是定义了一个变量叫mathFunction而且他的类型是(Int,Int) -> Int, 所以他是个函数，
var mathFunction: (Int,Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
//或者根本不定义，让Swift自己判断:
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
/*:
 ### Function Type as Parameter Types (函数类型作为参数)
 As the example below the first parameter is called mathFucntion, as you can see it is a function, and the second and third is Int.
 */

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)  //所以往里面传的是函数 和 数
//: And we also have the Function Type as Return Type
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
// and the function below, it returns a concrete function,which the types of the function is "(Int) -> Int"
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

/*: ### Nested Function
 -Note: Define a function inside a function
 */

func chooseStepFunction2(backward:Bool) -> (Int) ->Int{
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(backward: currentValue2 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!


