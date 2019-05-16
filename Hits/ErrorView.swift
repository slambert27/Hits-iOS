//
//  ErrorView.swift
//  Hits
//
//  Created by Samuel Lambert on 5/16/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    
    let label = UILabelFactory(text: "Unable to retrieve tracks").build()

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        accessibilityIdentifier = "error view"
        isAccessibilityElement = true
        
        addSubview(label)
        label.accessibilityIdentifier = "label"
        isAccessibilityElement = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
