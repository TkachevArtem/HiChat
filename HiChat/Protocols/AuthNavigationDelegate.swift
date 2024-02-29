//
//  AuthNavigationDelegate.swift
//  HiChat
//
//  Created by Artem Tkachev on 29.02.24.
//

import Foundation

protocol AuthNavigationDelegate: AnyObject {
    func toLoginVC()
    func toSignUpVC()
}
