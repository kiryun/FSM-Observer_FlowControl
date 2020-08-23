//
//  Core.swift
//  Core
//
//  Created by Gihyun Kim on 2020/08/17.
//  Copyright © 2020 Gihyun Kim. All rights reserved.
//

import Foundation

public protocol Observer {
    func update()
}

public protocol Subject {
    var observers: [Observer] {get set}
}
extension Subject{
    public mutating func attach(observer: Observer){
        print("Core:: attach")
        self.observers.append(observer)
    }
    
    func notifyObservers(){
//        print(self.observers.count)
        self.observers.forEach { (ob) in
            ob.update()
        }
    }
}

@objc open class Core: NSObject {
    @objc public static var shared = Core()
    
    public var observers: [Observer] = []
    
    private var currentState: State = .BEFORE_LOG_IN
    public var state: State{
        get{
            return self.currentState
        }
        
        // State가 set 되자마자 notification
        set(newVal){
//            print("state set")
            self.currentState = newVal
            self.notifyObservers()
        }
    }
    
    private override init() {
        super.init()
    }
}

extension Core: Subject{
    public enum State{
        case BEFORE_LOG_IN
        case AFTER_LOG_IN
        case STABLE
        case BEFORE_PAYMENT
        case PAYMENT_SUCCESS
        case BEFORE_PUSH
        case PUSH_SUCCESS
    }
}
