//
//  Push.swift
//  Push
//
//  Created by Gihyun Kim on 2020/08/22.
//  Copyright © 2020 Gihyun Kim. All rights reserved.
//

import Foundation
import Core

public class Push: Observer{
    public static var shared = Push()
    
    var core = Core.shared
    
    private init() {
        self.core.attach(observer: self)
    }
    
    // MARK: Subject를 통해 notify를 받는 곳
    public func update() {
        print("Push:: update notified : \(self.core.state)")
        
        var state = self.core.state
        
        // 로그인 성공했다면 payment 진행
        switch state {
        case .BEFORE_PUSH:
            self.push()
            break
        default:
            break
        }
        
    }
    
    public func push(){
        print("Push:: push")
        
        self.core.state = .PUSH_SUCCESS
        self.core.state = .STABLE
    }
}
