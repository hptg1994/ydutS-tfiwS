import UIKit
//: # Methods
//: - Note: Methods are funcrtions that are associated with a particulay type.Classe, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type.
//: ## Instance Method:
class Counter {
    var count = 0
    func increment() { //instance method: increment
        count += 1
    }
    func increment2(){
        self.count += 1
    }
    func increment(by amount: Int) { //instance method: increment(by: Int)
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.increment(by: 5)
// 计数值现在是6
counter.reset()
// 计数值现在是0

//: ### self属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x  //表示全局属性的x要大于参数的x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x:1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// 打印 "This point is to the right of the line where x == 1.0"
/*: ## Modifing Value Types from Within Instance Methods
 Pre-Condition:  Structure and enumerations are value types,By default, the properties of a value type cannot be modified from  within its instance menthods
 But: If have to change it, **mutating** it
*/
struct Point2 {
    var x = 0.0, y = 0.0 //这个值（self）是不能被structure里面的方法改变的，但是要改变，mutating
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
// Prints "The point is now at (3.0, 4.0)”
// Note that you cannot call a mutating method on a constant of structure type, because its properties cannot be changed, even if they are variable properties.
let fixedPoint = Point2(x:3.0,y:3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)  这个是错的，因为这个是let，除非是var

//: Assigning to self Within a Mutating Method
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight 现在等于 .High
ovenLight.next()
// ovenLight 现在等于 .Off
//: # Type Methods
//: how to call a type method on a class called SomeClass:
class SomeClass{
    class func someTypeMethod(){
        //type method implememtation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
//为了便于管理currentLevel属性，levelTracker定义了实例方法advance(to:), 这个方法会在更新currentLevel之前检查所请求的新等级是否已经解锁。
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
//Player 类使用LevelTracker来监测和更新每个玩家的发展进度：
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}
var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// 打印 "highest unlocked level is now 2"
player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// 打印 "level 6 has not yet been unlocked"


