import UIKit
//: # Properties
//: - Note: Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value.
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
//rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property
//: ### Lazy Stored Properties
//: A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration
class DataImporter {
    
    //DataImporter is a class to import data from an external file.
    //The class is assumed to take a non-trivial amount of time to initialize.
    
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created
/*: 类 DataManager 有一个名为 data 的存储属性，它被初始化为一个空的新 String 数组。尽管它的其余功能没有展示出来，还是可以知道类 DataManager 的目的是管理并提供访问这个 String 数组的方法。
 
 DataManager 类的功能之一是从文件导入数据。此功能由 DataImporter 类提供，它假定为需要一定时间来进行初始化。这大概是因为 DataImporter 实例在进行初始化的时候需要打开文件并读取其内容到内存中。
 
 DataManager 实例并不要从文件导入数据就可以管理其数据的情况是有可能发生的，所以当 DataManager 本身创建的时候没有必要去再创建一个新的 DataImporter 实例。反之，在 DataImporter 第一次被使用的时候再创建它才更有意义。
 
 因为它被 lazy 修饰符所标记，只有在 importer 属性 **第一次被访问** 时才会创建 DataManager 实例，比如当查询它的 fileName 属性时：
 */
print(manager.importer.fileName)

//: ## Computed Properties
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()  //初始化Point(), origin 作为他的承载对象，之后就可以origin.x origin.y
    var size = Size()
    var center: Point {  // 通过上面的origin 和 size 来（get）计算center的point，或者自己设置(set(newCenter))
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY) // 因为他是Point类型的所以最后要返回Point(x:centerX,y:centerY)
        }
        set(newCenter) {  //所以如果我们要单独调用的话，就是let initialSquareCenter = square.center & square.center = Point(x:15.0,y:15.0), newCenter = Point
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
//操作
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
print("The original center of the square is (\(square.center.x),\(square.center.y))")
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y)),and the origin center value will change to (\(square.center.x), \(square.center.y)) because origin is change and center get the new value")
// prints "square.origin is now at (10.0, 10.0)"
/*这个例子定义了三个结构
  * Point 封装了一个(x,y)结构
  * Size 封装了一个width 和 height 结构
  * Rect 封装了一个长方形包括原点和大小
 */
//: ### Read Only Computed Properties: which to get rid of get and set(因为没有setter)
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
