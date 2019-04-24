//
//  TrackCell.swift
//  Hits
//
//  Created by Sam Lambert on 4/20/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    var rank = UILabelFactory(text: "").fontSize(of: 14).textColor(of: .lightGray).build()
    var name = UILabelFactory(text: "name").adjustable().build()
    var artist = UILabelFactory(text: "artist").fontSize(of: 16).textColor(of: .lightGray).build()

    var album: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     A function that sets the text for all labels of a TrackTableViewCell from index of Tracks list
    */
    func setTrackAttributes(with tracks: [Track], at index: Int) {
        rank.text = String(index + 1)
        name.text = tracks[index].name
        artist.text = tracks[index].artist
    }
    
    func setImage(with tracks: [Track], at index: Int) {
        if tracks[index].albumArt == nil {
            return
        }
        NetworkRequest().retrieveImage(from: tracks[index].albumArt!, completionHandler: { (img: UIImage) -> () in
            DispatchQueue.main.async {
                self.album.image = img
            }
        })
    }
    
    private func setupLabels() {
        contentView.addSubview(rank)
        contentView.addSubview(name)
        contentView.addSubview(artist)
        contentView.addSubview(album)
        
        rank.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        rank.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        rank.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        rank.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        album.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        album.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        album.heightAnchor.constraint(equalToConstant: 90).isActive = true
        album.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        name.leadingAnchor.constraint(equalTo: album.trailingAnchor, constant: 12).isActive = true
        name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        name.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 64).isActive = true
        
        artist.leadingAnchor.constraint(equalTo: album.trailingAnchor, constant: 12).isActive = true
        artist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        artist.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 6).isActive = true
        artist.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
