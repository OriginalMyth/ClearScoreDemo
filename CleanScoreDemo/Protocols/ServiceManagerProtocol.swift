//
//  ServiceManagerProtocol.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 05/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


protocol ServiceManagerProtocol {
    
    func getCreditData(handler : @escaping (NetworkError?) -> Void)
    
}
