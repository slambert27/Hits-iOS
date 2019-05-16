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
    
    var errorView = ErrorView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TrackTableViewCell.self, forCellReuseIdentifier: cellId)

        tableView.backgroundColor = .black
        
        NetworkRequest().retrieveTracks(completionHandler: {
            tracks in
            self.tracks = tracks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, errorHandler: {
            DispatchQueue.main.async {
                self.showErrorView()
            }
        })
    }

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
            
            if (indexPath.row < tracks!.tracks.count - 1) &&
                (tracks!.tracks[indexPath.row].rating != tracks!.tracks[indexPath.row + 1].rating) {
                
                cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            } else {
                cell.separatorInset = UIEdgeInsets(top: 0, left: 1000, bottom: 0, right: 0)
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if (indexPath.row < tracks!.tracks.count - 1) &&
            (tracks!.tracks[indexPath.row].rating != tracks!.tracks[indexPath.row + 1].rating) {
            
            return 150
        } else {
            return 125
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func showErrorView() {
        tableView.addSubview(self.errorView)
        errorView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        errorView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        errorView.heightAnchor.constraint(equalToConstant: tableView.frame.height).isActive = true
        errorView.widthAnchor.constraint(equalToConstant: tableView.frame.width).isActive = true
    }
}
