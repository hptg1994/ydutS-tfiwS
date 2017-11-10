import UIKit
//: # Enumeration
//: - Note: Enumeration defines a common type for a group of related values and enable you to work with those values in a type-safe way within your code
enum CompassPoint {
    case north
    case south
    case east
    case west
}
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var plant = Planet.mercury
plant = .jupiter
//: ### Matching Enumeration Values with a Switch Statement
var directionToHead = CompassPoint.south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
//: ### Associated Values
//: See below: "Define an enummeration type call Barcode, which can take either a value of upc with an associated value of type(Int,Int,Int,Int), or a value of qrCode with an associated value of type String"
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
//and so, able to store value into Barcode;
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
//: - Note: if all of the associated values for an enumeration case are extracted as constants ,or if all are extracted as variables,you can place a single var or let annotation before the case name:
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}





