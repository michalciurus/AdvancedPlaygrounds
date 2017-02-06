//: Playground - noun: a place where people can play

import UIKit

struct OneState {}
struct OtherState {}

protocol Action {
    associatedtype ActionStateType
    
    func updatedState(currentState: ActionStateType) -> ActionStateType
}

struct IncrementAction: Action {
    
    func updatedState(currentState: OneState) -> OneState {
        return currentState
    }
}

struct SomeOtherAction: Action {
    
    func updatedState(currentState: OtherState) -> OtherState {
       return currentState
    }
}

// Oops, can't do it. Associated types can be used only as constraints
//let genericAction: Action = SomeOtherAction()

// We could do that with generics though! So let's create a wrapper!

struct AnyAction<T: Action>: Action {
    
    private let action: T
    
    init(_ action: T) {
        self.action = action
    }
    
    func updatedState(currentState: T.ActionStateType) -> T.ActionStateType {
        return action.updatedState(currentState: currentState)
    }
    
}

let wrappedGenericAction = AnyAction(SomeOtherAction())



