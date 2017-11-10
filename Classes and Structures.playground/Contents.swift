import UIKit
//: # Classes and Structures
/*: - Note:
    Same:
    * Define properties to store values
    * Define methods to provide functionality
    * Define subscripts to provide access to their values using subscript syntax
    * Define initializers to set up their initial state
    * Be extended to expand their functionality beyond a default implementation
    * Conform too protocols to provide standard functionality of a certain kind
    Not  Same:
    * Inheritance enables one class to inherit the characteristics of another
    * Type casting enables you to check and interpret the type of a class instance at runtime
    * Deinitiallizers enable an instance of a class to free up any resources it has assigned
    * Reference counting allows more than one reference to a class instance.
 */
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//creating insstance
let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResoulation is \(someResolution.width)")
// prints "The width of someResolution is 0"
someVideoMode.resolution.width = 1280
print("The width of someResoulation is \(someResolution.width)")
//: Memberwise Initializers for Structure Types
let vga = Resolution(width:640, height: 480)
