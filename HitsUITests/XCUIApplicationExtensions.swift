//
//  XCUIApplication Extensions.swift
//  HitsUITests
//
//  Created by Samuel Lambert on 5/16/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import XCTest

extension XCUIApplication {
    func verifyCellContents() -> Bool {
        let cell = cells["track cell"].firstMatch
        
        let rank = cell.staticTexts["rank"]
        let track = cell.staticTexts["track name"]
        let album = cell.images["album image view"]
        let artist = cell.staticTexts["artist name"]
        
        if !(rank.exists && track.exists && album.exists && artist.exists) {
            return false
        }
        return true
    }
}
