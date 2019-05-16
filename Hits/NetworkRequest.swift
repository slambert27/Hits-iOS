//
//  NetworkRequest.swift
//  Hits
//
//  Created by Sam Lambert on 4/20/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct NetworkRequest {
    
    private let tracksURL = URL(string: "http://somesongsarebetter.com/hits/v1/tracks")
    
    func retrieveTracks(completionHandler: @escaping (_ tracks: Tracks) -> (), errorHandler: @escaping () -> ()) {
        if ProcessInfo.processInfo.environment["mockTracks"] == nil {
            if let url = tracksURL {
                let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if error != nil || data == nil {
                        //handle error
                        errorHandler()
                        return
                    }
                    guard let tracks = try? JSONDecoder().decode(Tracks.self, from: data!) else {
                        //handle error
                        errorHandler()
                        return
                    }
                    completionHandler(tracks)
                })
                task.resume()
            }
        }
        else {
            let string = ProcessInfo.processInfo.environment["mockTracks"]
            let data = string?.data(using: .ascii)
            guard let tracks = try? JSONDecoder().decode(Tracks.self, from: data!) else {
                errorHandler()
                return
            }
            completionHandler(tracks)
        }
    }
    
    func retrieveImage(from URL: URL?, completionHandler: @escaping (_ img: UIImage) -> ()) {
        if let url = URL {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil || data == nil {
                    //handle error
                    print(error ?? "no data")
                    return
                }
                if let image = UIImage(data: data!) {
                    completionHandler(image)
                } else {
                    return
                }
            })
            task.resume()
        }
    }
}
