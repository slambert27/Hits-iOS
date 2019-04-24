//
//  Track.swift
//  Hits
//
//  Created by Sam Lambert on 4/20/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import Foundation

/**
 An object that contains data needed to display a track.
 */
struct Track: Decodable {
    
    var name: String
    var rating: Int
    var album: String
    var albumArt: URL?
    var artist: String
}

class Tracks: Decodable {

    var tracks: [Track]
}
