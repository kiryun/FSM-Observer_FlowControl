//
//  API.swift
//  API
//
//  Created by Gihyun Kim on 2020/08/19.
//  Copyright © 2020 Gihyun Kim. All rights reserved.
//

import Foundation
import Member
import Push
import Store

public class API{
    public static var shared = API()
    
    var member = Member.shared
    var push = Push.shared
    var store = Store.shared
    
    private init(){
        
    }
    // login
    public func login(){
        Member.shared.login()
    }
}
