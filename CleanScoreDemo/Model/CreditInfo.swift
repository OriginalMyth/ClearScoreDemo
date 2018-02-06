//
//  CreditInfo.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 05/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation

struct CreditInfo {
    
    let score : Int
    let maxScoreValue : Int
    let minScoreValue : Int
    
    init(json : [String : Any]) {
        score = json["score"] as! Int
        maxScoreValue = json["maxScoreValue"] as! Int
        minScoreValue = json["minScoreValue"] as! Int
    }

    
}
