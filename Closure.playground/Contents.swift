/*:
 # Closure
 - Note: 准确的来讲，是**Closure Expression**。
 */
import UIKit
/*: ### Nested Function
 - Note: Sometimes useful to write shorter versions of function-like constructs without a full declaration and name.

 For Example : sorted(by:): accepts a closure that takes two arguments of the same types as the array's contents,and returns Bool Value to say whether the first value should appear before or after the second value once the values are sorted.True: the first value should appear before the second value, and false otherwise
 */
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backward(_ s1:String, _ s2:String) -> Bool{
    return s1>s2
}
var reversedNames = names.sorted(by:backward)
//so if the first string(s1) is greater than the second string(s2),the backward(_:_:) will return true

//: But, It is not good ☝️ So Closure Expression Syntax : { (parameters) -> (return type) in statements }, 所以上面的那个可以写成：
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})// eg : 把函数写在了sorted(by:里面)
//: 但是，从而就来了 Inferring Type From Context
//: - Note: 因为在names.sorted(by:{s1,s2 in return s1 > s2}) 里面，names里面的东西是String，所以sorted(by:)能够知道他的参数，而且也应当得知返回的是Bool⇒ sorted(by: Bool),所以，这些都可以被忽略了！
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
//: ### Shorthand Argument Names
//: Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure's arguments by the names $0,$1,$2, and so on
reversedNames = names.sorted(by: { $0 > $1 } )
//: ### Operation Methods
reversedNames = names.sorted(by: >)



let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]
let numbers = [16,58,510]
let strings = numbers.map{
    (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number%10]! + output
        number /= 10
    }while number > 0
        return output
}
print(strings)


