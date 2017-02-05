//: Playground - noun: a place where people can play

import UIKit

protocol MyProtocol {
}
struct MyStruct: MyProtocol {
}
extension MyStruct {
    func extensionMethod() {
        print("In Struct")
    }
}
extension MyProtocol {
    func extensionMethod() {
        print("In Protocol")
    }
}

let myStruct = MyStruct()
let proto: MyProtocol = myStruct

myStruct.extensionMethod()

//Dispatch of the protocol extensions is *always* static
proto.extensionMethod()

final class foo {
    // always uses static dispatch because of final
    func method() {
        
    }
}

final class bar {
    // Useless, really, but might still worth knowing! it also has a `never` attribute
    @inline(__always) func method() {
        
    }
}

class mayBeUsedInObjc {
    
   // Apply this modifier to any member of a class that can be represented by Objective-C. When you mark a member declaration with the dynamic modifier, access to that member is always dynamically dispatched using the Objective-C runtime. Access to that member is never inlined or devirtualized by the compiler.
   // Because declarations marked with the dynamic modifier are dispatched using the Objective-C runtime, they’re implicitly marked with the objc attribute.
   // It mean that your property/method can be access by Objective-C code or class. Normally it happen when you sub-classing a Swift class of Objective-C base class.

    dynamic func myMethod() {
        
    }
}

// ======== time for bugs


// For some reason NSObjects use a table dispatch
class Person: NSObject {
    func sayHi() {
        print("Hello")
    }
}
func greetings(person: Person) {
    person.sayHi()
}
greetings(person: Person()) // prints 'Hello'

class MisunderstoodPerson: Person {}

// And NSObjects extensions use a DYNAMIC DISPATCH
extension MisunderstoodPerson {
    override func sayHi() {
        print("No one gets me.")
    }
}

//So `sayHi` is not really overriden in terms of table dispatch
greetings(person: MisunderstoodPerson()) // prints 'Hello'

//https://www.raizlabs.com/dev/2016/12/swift-method-dispatch/