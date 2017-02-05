//: Playground - noun: a place where people can play

import Foundation

protocol Y {
    
}

class A {
    
}

class B: A, Y {
    
    required override init() {
        
    }
    
    class func typeMethod() {
        print("I'm an A type method")
    }
}

var metaTypeB: B.Type = B.self
var metaTypeB2: B.Type = B.self

// unsuprisingly `B.self` is always in the same place in the memory
metaTypeB === metaTypeB2

// Also of course is true
metaTypeB == metaTypeB2

// B.Type is `AnyObject`, so it's a by reference type
metaTypeB is AnyObject

// internal name of the class "module.className"
NSStringFromClass(metaTypeB)

// These are called type methods
metaTypeB2.typeMethod()

//===============================

// we can call init on the metatype
let obj = B.self.init()

let dynamicType: AnyObject.Type = type(of: obj)

dynamicType === B.self

//======== Protocols

// The protocol metatype can hold classes metatypes that conform to it
let protocolMetaType: Y.Type = B.self

//We cannot call init directly on protocol metatype
//let protocolObj = protocolMetaType.init()

B.self == protocolMetaType

// Of course we can also cast metatypes
let concreteMetatype = protocolMetaType as! B.Type
// This doesn't require the 'required init`
B.self.init()
// but this does :o
let object = concreteMetatype.init()

// ===== We have to go deeper

let deep = B.self
let deeper = type(of: deep)
let evenDeeper = type(of: deeper)

// Now we have a metatype of a metatype of a metatype
// I don't think anyone's ever going to use it though :D