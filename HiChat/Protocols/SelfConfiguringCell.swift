//
//  SelfConfiguringCell.swift
//  HiChat
//
//  Created by Artem Tkachev on 27.01.24.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseID: String { get }
    func configure(with value: HChat)
}
