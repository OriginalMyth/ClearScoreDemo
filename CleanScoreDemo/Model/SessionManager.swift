//
//  SessionManager.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 06/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation

class SessionManager : SessionManagerProtocol {
    
    static let sharedInstance = SessionManager()
    var creditInfoUser : CreditInfo?
    
    private init(){
    }
    
}
