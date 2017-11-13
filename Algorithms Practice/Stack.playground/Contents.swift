// import UIKit
public struct Stack<T> {
    fileprivate var array = [T]()
    
    /* 这里几个误区 ：
    1.这个是struct，所以自带init
    2.要写init也没有关系，就像下面那样写，然后像下下面那样调用*/
    init(array:[T]) {
        self.array = array
    }
    
    var count:Int{
        return array.count
    }

    var isEmpty:Bool{
        return array.isEmpty
    }
    
    public mutating func push(_ element :T){
        array.append(element)
    }

    public mutating func pop() -> T?{
        return array.popLast()
    }

    public var top:T? {
        return array.last
    }
}
/* Testing area */
// 因为这个是struct，所以自带init
// 所以是stack = Stack(array:....) 这样子
var array = [1,2,3,5]
var stack = Stack(array:array)

stack.push(6)
print(stack.array);





