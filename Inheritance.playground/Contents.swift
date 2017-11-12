import UIKit
//: # Inheritance
class Vehicle{
    var currentSpeed = 0.0
    var description : String {
        return "traveling at \(currentSpeed) miles per hours"
    }
    func makeNoise(){
        //do nothing - an arbitary vehicle doesn't necessarily make a noise
    }
}
let someVehicle = Vehicle();
print("Vehicle:\(someVehicle.description)")
//: ###Subclassing
class Bicycle: Vehicle{
    var hasBaket = false
}
let bicycle = Bicycle()
bicycle.hasBaket = true;
bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")
//Bicycle 本身也可以被继承
class Tandem: Bicycle{
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBaket = true;
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem:\(tandem.description)")
//: ###Overriding
//: overriding Methods
class Train: Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
//: ### Overriding Properties
//: Overriding Properties Getters and Setters
class Car: Vehicle{
    var gear = 1 //Vehicle 是没有这个properties
    override var description: String{
        return super.description + " in gear\(gear)" //super.description = return "traveling at \(currentSpeed) miles per hours" 另外这个super.description 也可以完全不要，就是完全重写这个方法。
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")
//: ### Overriding Property Observes
class AutomaticCar : Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed/10.0)+1
        }
        willSet{
            print(super.description)
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0 // 在这个之前就已经把willSet的内容print了出来了,然后就是下面那条print(automatic.currentSpeed)
print(automatic.currentSpeed)
print("AutomaticCar:\(automatic.description)")
//: ###Prevent Overriding
//: 添加final var final func final class func







