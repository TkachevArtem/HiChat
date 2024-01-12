//
//  UIStackView + Extension.swift
//  HiChat
//
//  Created by Artem Tkachev on 12.01.24.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spaing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spaing
    }
}
