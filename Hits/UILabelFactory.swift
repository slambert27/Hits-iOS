//
//  UILabelFactory.swift
//  Hits
//
//  Created by Sam Lambert on 4/21/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct UILabelFactory {
    
    private let label: UILabel
    private let defultFontSize: CGFloat = 20
    
    // MARK: - Inits
    init(text: String) {
        label = UILabel()
        label.textColor = .white
        label.text = text
        label.font = label.font.withSize(defultFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Public methods
    func build() -> UILabel {
        return label
    }
    
    func fontSize(of size: CGFloat) -> UILabelFactory {
        label.font = label.font.withSize(size)
        
        return self
    }
    
    func textColor(of color: UIColor) -> UILabelFactory {
        label.textColor = color
        
        return self
    }
    
    func adjustable() -> UILabelFactory {
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 2
        label.sizeToFit()

        return self
    }
}
