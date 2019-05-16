//
//  HitsUITests.swift
//  HitsUITests
//
//  Created by Sam Lambert on 4/21/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import XCTest

class HitsUITests: XCTestCase {
    
    let app = XCUIApplication()
    let errorData = ""

    override func setUp() {
        continueAfterFailure = false
    }

    func testError() {
        app.launchEnvironment["mockTracks"] = errorData
        app.launch()
        
        print(app.debugDescription)
        let view = app.otherElements["error view"]
        XCTAssert(view.exists)
    }
    
    func testData() {
        app.launch()
        
        print(app.debugDescription)
        XCTAssert(app.verifyCellContents())
    }
}
