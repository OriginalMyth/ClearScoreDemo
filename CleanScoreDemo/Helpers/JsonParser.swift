//
//  JsonParser.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 06/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


class JsonParser: JsonParserProtocol {
    
    var sessionManager : SessionManagerProtocol
    
    init() {
        sessionManager = SessionManager.sharedInstance
    }
    
    func parse(json : Any, handler : @escaping (NetworkError?) -> Void) {
        if let jsonObject = json as? [String:Any] {
            if let creditData = jsonObject["creditReportInfo"] as? [String:Any] {
                 let creditScore = CreditInfo(json: creditData)
                print("creditScore is \(creditScore.score)")
                sessionManager.creditInfoUser = creditScore
                handler(nil)
            }
        } else {
            //Parse error
            handler(NetworkError.networkError)
        }
        

    }
    
}
