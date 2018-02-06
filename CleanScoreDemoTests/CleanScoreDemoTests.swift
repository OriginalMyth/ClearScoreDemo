//
//  CleanScoreDemoTests.swift
//  CleanScoreDemoTests
//
//  Created by Fong Bao on 05/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import XCTest
@testable import CleanScoreDemo

class CleanScoreDemoTests: XCTestCase {
    
    var scoreUnit : [String:Any]?

    override func setUp() {
        super.setUp()
        let data = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "creditReturnedScore", ofType:"json")!)
        let parsedData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        if let json = parsedData as? [String:Any] {
             if let creditData = json["creditReportInfo"] as? [String:Any] {
                //print("test data \(json)")
                scoreUnit = creditData
            }
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJsonModel() {
        
        let score = 514
        let maxScore = 700
        let minScore = 0

        XCTAssertNotNil(scoreUnit, "scoreUnit should not be nil")
        let creditScore = CreditInfo(json: scoreUnit!)
        XCTAssertTrue(creditScore.score == score, "Model score should match json")
        XCTAssertTrue(creditScore.maxScoreValue == maxScore, "Model maxScore should match json")
        XCTAssertTrue(creditScore.minScoreValue == minScore, "Model minScore should match json")
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func retrieveJsonStringFromBundle(filePath: String) -> Data? {
        if let jsonData =  try? Data(contentsOf: URL(fileURLWithPath: filePath), options: Data.ReadingOptions.uncached) {
            return jsonData
        }
        else {
            return nil
        }
    }
    
    


    
}
