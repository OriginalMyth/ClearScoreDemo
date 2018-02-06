//
//  JsonParserProtocol.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 06/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation

protocol JsonParserProtocol : ParserProtocol {
    
    
    func parse(json : Any, handler : @escaping (NetworkError?) -> Void)
    
    
}
