// import UIKit
//: # Linked List
public final class LinkedList<T>{
    
    public class LinkedListNode<T>{
        var value:T
        var next:Node?
        weak var previous:Node?
        init(value:T) {
            self.value = value
        }
    }
    
    typealias Node = LinkedListNode<T>
    
    var head : Node?
    
    var isEmpty:Bool{
        return head == nil
    }
    
    var firstNode:Node?{
        return head
    }
    
    /* var last:Node?{
     if var node = head {
     while case let next? = node.next {
     node = next
     }
     return node
     }
     else {
     return nil
     }
     } */
    
    var lastNode:Node?{
        if var node = head{
            while node.next != nil {
                node = node.next!
            }
            return node
        }else{
            return nil
        }
    }
    
    /* var count: Int{
     if var node = head {
     var c = 1
     while case let next? = node.next{
     node = next
     c += 1
     }
     return c
     }else{
     return 0
     }
     } */
    var count:Int{
        if var node = head{
            var c = 1
            while node.next != nil{
                node = node.next!
                c += 1
            }
            return c
        }else{
            return 0
        }
    }
    
    /* return a node a specific index */
    func node(atIndex index : Int) -> Node?{
        var i = index
        if i >= 0{
            var node = head
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    /* append a value at the end of the list */
    func append(_ value : T) -> Void {
        func append(_ node:Node){
            let newNode = LinkedListNode(value:node.value)
            if let lastNode = lastNode {
                newNode.previous = lastNode
                lastNode.next = newNode
            }else{
                head = newNode
            }
        }
        let newNode = LinkedListNode(value : value)
        append(newNode) //self指的是LinkedList这个类，append是这个类的一个方法
    }
    
    public func append(_ list:LinkedList){
        var nodeToCopy = list.head
        while let node = nodeToCopy{
            self.append(node.value)
            nodeToCopy = node.next
        }
    }
    
    func nodesBeforeAndCurrent (index:Int) -> (Node?,Node?){
        assert(index >= 0) //断言输入的index一定大于0， 如果不是就会出现 assert fail
        var i = index 
        var current = head
        var prev:Node?
        while current != nil && i > 0{
            i -= 1
            prev = current
            current = current!.next
        }
        assert(i==0) // 如果i>0，越界了！！！
        return(prev,current)
    }
    
    /* Insert a value at a specific indexs */
    public func Insert(_ value:T, atIndex index:Int){
        
        func insert(_ node:Node,atIndex index:Int) -> Void {
            let(prev,current) = nodesBeforeAndCurrent(index:index)
            let newNode = Node(value:node.value)
            newNode.previous = prev
            newNode.next = current
            prev?.next = newNode //这要是在java里面还得判断一下
            current?.previous = newNode
            if prev == nil{
                head = newNode
            }
        }
        assert(index >= 0)
        
        let newNode = LinkedListNode(value:value)
        insert(newNode,atIndex:index)
    }
    
    public func Insert(_ list:LinkedList,atIndex index : Int){
        if list.isEmpty{return}
        var(prev,current) = nodesBeforeAndCurrent(index:index)
        var nodeToCopy = list.head
        var newNode:Node?
        while let node = nodeToCopy{
            newNode = LinkedListNode(value:node.value)
            newNode?.previous = prev
            if let previous = prev {
                previous.next = newNode
            }else{
                self.head = newNode
            }
            
            nodeToCopy = nodeToCopy?.next
            prev = newNode
        }
        
        prev?.next = current
        current?.previous = prev
    }
    
    public func removeAll(){
        head = nil
    }
    
    @discardableResult func remove(node: Node) -> T{
        let prev = node.previous
        let next = node.next
        
        if let prev = prev{
            prev.next = next 
        }else{
            head = next
        }
        next?.previous = prev
        node.next = nil
        return node.value
    }//discardableResult的意思就是，不一定真的要返回这个 return node.val,有用就用，没用就拉倒，反正主要目的达到了
    
    
    /* discardableResult
     
     struct Caculator {
     func sum(a:Int,b:Int) -> Int {
     return a + b
     }
     
     @discardableResult
     func func1(a:Int,b:Int) ->Int {
     return a - b + 1
     }
     }
     let ca = Caculator()
     ca.sum(a: 1, b: 2) // 此处会警告，因为方法有返回值但是没有接收
     let _ = ca.sum(a: 1, b: 2) // 使用"_"接收无用返回值
     ca.func1(a: 1, b: 2) // 由于func1添加了@discardableResult声明，即使不接收返回值也不会警告 */
    @discardableResult public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node:lastNode!)
    }

    @discardableResult public func remove(atIndex index : Int) -> T{
        let node = self.node(atIndex:index)
        assert(node != nil)
        return remove(node: node!)
    }
    
    public func printLinkedList(){
        for index in 0...linkedlist.count{
            if let value = linkedlist.node(atIndex: index){
                print("\(value.value) ",terminator:"")
            }else{
                print("nil")
            }
        }
    }
}

var linkedlist = LinkedList<Int>()
linkedlist.append(1)
linkedlist.append(2)
linkedlist.append(3)
linkedlist.append(4)

linkedlist.printLinkedList()

print(linkedlist.firstNode!.value)
print(linkedlist.lastNode!.value)
linkedlist.removeLast()
print(linkedlist.removeLast()) // 因为是个discardableValue 所以在这里用到了
linkedlist.Insert(10, atIndex: 1)
linkedlist.printLinkedList()



