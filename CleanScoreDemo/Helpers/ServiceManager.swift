//
//  ServiceManager.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 05/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager : ServiceManagerProtocol {
    
    let jsonParser : JsonParserProtocol
    
    init() {
        jsonParser = JsonParser()
    }
    
    func getCreditData(handler : @escaping (NetworkError?) -> Void) {
        Alamofire.request(Constants.clearScoreEndpoint).responseJSON { [weak self] response in
            if let error = response.result.error as? AFError{
                //request errored
                print("request errored error.responseCode is \(String(describing: error.responseCode)) ... error.errorDescription is \(String(describing: error.errorDescription))")
                handler(NetworkError.networkError)
            } else if response.result.isSuccess {
                if let json = response.result.value {
                    self?.jsonParser.parse(json: json, handler: { error in
                        handler(error)
                    })
                } else {
                    //Invalid response
                    print("Invalid response")
                    handler(NetworkError.networkError)
                }
            } else {
                //request failed
                print("request failed response.response?.statusCode\(String(describing: response.response?.statusCode))")
                handler(NetworkError.networkError)
            }
        
            
            
            }
        }
    
    
}
