//
//  TracksViewController.swift
//  Hits
//
//  Created by Sam Lambert on 4/20/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class TracksViewController: UITableViewController {
    
    let cellId = "cell"
    var tracks: Tracks?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.backgroundColor = .black
        
        NetworkRequest().retrieveTracks {
            tracks in
            self.tracks = tracks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let validTracks = tracks?.tracks {
            return validTracks.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TrackTableViewCell
        
        if let validTracks = tracks?.tracks {
            cell.setTrackAttributes(with: validTracks, at: indexPath.row)
            cell.setImage(with: validTracks, at: indexPath.row)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
