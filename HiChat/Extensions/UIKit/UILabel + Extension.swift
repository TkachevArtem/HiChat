//
//  UILabel + Extension.swift
//  HiChat
//
//  Created by Artem Tkachev on 9.01.24.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
