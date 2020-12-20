import UIKit

/*
 Conforming a Protocol
 */

protocol MyProtocol {
// Protocol requeriments
}
protocol AnotherProtocol {
// Protocol requeriments
}
protocol ThirdProtocol {
// Protocol requeriments
}
struct MyStruct: MyProtocol, AnotherProtocol, ThirdProtocol {
//structure implementation here
}

enum MyEnum: MyProtocol, AnotherProtocol, ThirdProtocol {
//enum implementation here
}

class MyClass: MyBaseClass, MyProtocol, AnotherProtocol, ThirdProtocol {
//class implementation here
}

/*
 Protocol Properties and Functions
 */

protocol MyProtocol {
  
  var readOnlyProperty: String { get }
  var readAndWriteProperty: String { get set }
     
  func myFunc() -> String
  mutating func mutatingFunc() -> String
  
  static var staticReadOnlyProperty: String { get }
  static func staticFunc() -> String
}

/*
 Let’s make an example:
 */


protocol MyProtocol {
  var readOnlyProperty: String { get }
}

struct MyStruct: MyProtocol {
    let readOnlyProperty: String  // concrete implementation: stored constant property
}

struct OtherStruct: MyProtocol {

    var i = 0
    var readOnlyProperty: String { return "\(i)" }  // concrete implementation: computed property
}

struct MyThirdStruct: MyProtocol {
    var readOnlyProperty: String  // concrete implementation: stored constant property

    mutating func changeProperty() {
        readOnlyProperty = ""
    }
}

//AN EXAMPLE USING OUR STRUCTS IN A VIEW
class ViewController: UIViewController {
    var myStruct = MyStruct(readOnlyProperty: "myStruct")
    var otherStruct = OtherStruct()
    var myThirdStruct = MyThirdStruct(readOnlyProperty: "myThirdStruct")

    func changeStructs() {
        // not possible, readOnlyProperty is a let constant
//        myStruct.readOnlyProperty = "hi"
        //not possible computed property
//        otherStruct.readOnlyProperty = "hoi"
        myThirdStruct.readOnlyProperty = "hey"
        print(myThirdStruct.readOnlyProperty)
      //PRINTED HEY
    }
}

/*
 Protocols also can define optional properties and functions but it requires to mark the protocol and the property and/or function with the objc attribute.
 */


@objc protocol MyOptionalProtocol {
    @objc var optionalProperty: String { get set }
    @objc optional func optionalFunction()
}

