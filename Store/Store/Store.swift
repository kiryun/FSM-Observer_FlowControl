//
//  Store.swift
//  Store
//
//  Created by Gihyun Kim on 2020/08/22.
//  Copyright © 2020 Gihyun Kim. All rights reserved.
//

import Foundation
import Core

public class Store: Observer{
    public static var shared = Store()
    var core = Core.shared
    
    private init() {
        self.core.attach(observer: self)
    }
    
    // MARK: Subject를 통해 notify를 받는 곳
    public func update() {
        print("Store:: update notified : \(self.core.state)")
        
        let state = self.core.state
        
        // 로그인 성공했다면 payment 진행
        switch state {
        case .BEFORE_PAYMENT:
            self.payment()
            break
        default:
            break
        }
        
    }
    
    public func payment(){
        print("Store:: payment")
        
        self.core.state = .PAYMENT_SUCCESS
        self.core.state = .BEFORE_PUSH
    }
}
