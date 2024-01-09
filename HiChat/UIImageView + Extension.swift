//
//  UIImageView + Extension.swift
//  HiChat
//
//  Created by Artem Tkachev on 9.01.24.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
