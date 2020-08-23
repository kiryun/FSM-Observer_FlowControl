//
//  Member.swift
//  Member
//
//  Created by Gihyun Kim on 2020/08/19.
//  Copyright © 2020 Gihyun Kim. All rights reserved.
//

import Foundation
import Core

public class Member: Observer{
    public static var shared = Member()
    
    var core = Core.shared
    
    private init() {
        self.core.attach(observer: self)
    }
    
    // MARK: Subject를 통해 notify를 받는 곳
    public func update() {
        print("Memeber:: update notified : \(self.core.state)")
    }
    
    public func login(){
        print("Member:: Login")
        
        // Login Successed
        self.core.state = .AFTER_LOG_IN
        self.core.state = .BEFORE_PAYMENT
    }
}
