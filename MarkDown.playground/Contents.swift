//: **Bold** *Italic*
/*:

 # h1
 ## h2
 ### h3
 #### h4 h5 h6 same as h3
 ---
 ---
 ---
 * blank seperate lines below
 ******
 ---
 ---
 ---
 ---
 * unordered list
 - unordered list
 + unordered list
 ---
 ---
 1. ordered list
 2. ordered list
 3. ordered list
 ---
 ---
 ---
 
 [baidu link](https://www.baidu.com)
 
 ---
 ---
 ---
 > first level quoting
 > > nested blockquote
 > > > nested level quoting
 > > > * use list in quote
 ---
 ---
 ---
 
 
 ![img](MFR_playground.png)
 
 
 [Go to next page](@next)
  */

/*:
 # Swift Standard Library
 - Important: This documentation contains preliminary information about an API or technology in development. This information is subject to change, and software implemented according to this documentation should be tested with final operating system software.
 
 The Swift standard library implements the basic data types, algorithms, and protocols you use to write apps in Swift. It includes high-performance fundamental data types such as `String` and `Array`, along with generic algorithms such as `sort()` and `filter(_:)`. Powerful protocols that describe shared traits and behaviors define reusable building blocks for higher level types. Classes in the Foundation framework with standard library counterparts–such as `NSArray` and `Array`–are bridged. When you work with Objective-C frameworks, your Swift code gains the performance improvements and flexibility of the Swift standard library.
 
 On each page of this playground, you will experiment with Swift standard library types and high-level concepts using visualizations and practical examples. You will also learn how the Swift standard library uses protocols and generics to express powerful constraints.
 
 - [Text](Text)
 - [Indexing and Slicing Strings](Indexing%20and%20Slicing%20Strings)
 - [Customizing Textual Representations](Customizing%20Textual%20Representations)
 - [Sequences and Collections](Sequences%20and%20Collections)
 - [Understanding Value Semantics](Understanding%20Value%20Semantics)
 - [Processing Sequences and Collections](Processing%20Sequences%20and%20Collections)
 - [Slicing Collections](Slicing%20Collections)
 - [Understanding Collection Protocols](Understanding%20Collection%20Protocols)
 - [Creating a Generic Collection](Creating%20a%20Generic%20Collection)
 - [Revision History](Revision%20History)
 - [License](License)
 ****
 [Next](@next)
 */
/*:
 [Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
   ****
 # Indexing and Slicing Strings
 It's common to think of a string as a sequence of the characters you see on screen. However, what you perceive as a character may in some cases be represented by multiple, variable-length Unicode scalars in memory. For example, it requires more bits to encode a character like the top hat emoji (`🎩`) than a simple character like the letter `A`, and it requires multiple Unicode scalars to represent characters with combining marks, such as é⃝. For more information about Unicode support in Swift, see [Strings and Characters](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-ID285) in _The Swift Programming Language_.
 
 In Swift, the `String` type handles these details for you. Each `Character` element in a string represents a user-perceived Unicode character, regardless of the character's length or representation in memory. However, because of this abstraction, it doesn't make sense to index into a string using integers. Instead, the standard library includes `String.Index`, a type that better represents a position in any string, regardless of its representation in memory.
 
 Take a look at the string below, which contains various Unicode characters of different sizes and complexity.
 */
var str = "Héllo, 🇺🇸laygr😮und!"
/*:
 Here's what it looks like when you plot the string's characters against their user-perceived indices. Notice that even though the flag (🇺🇸) is actually a grapheme cluster made up of two combining Unicode scalars, Swift counts the flag as just one user-perceived character. This makes tasks like form validation, cursor positioning, and text wrapping much simpler to implement. Counting, indexing, and slicing are all based on user-perceived character indices, rather than the layout of the string in memory.
 */
