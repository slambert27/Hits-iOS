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
    
    func retrieveTracks(completionHandler: @escaping (_ tracks: Tracks) -> ()) {
        if let url = tracksURL {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil || data == nil {
                    //handle error
                    print(error ?? "no data")
                    return
                }
                guard let tracks = try? JSONDecoder().decode(Tracks.self, from: data!) else {
                    //handle error
                    print("Error: Couldn't decode data into Tracks")
                    return
                }
                completionHandler(tracks)
            })
            task.resume()
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
