//
//  UserError.swift
//  HiChat
//
//  Created by Artem Tkachev on 29.02.24.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExit
    case cannotGetUserInfo
    case cannotUnwrapToHUser

}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Please fill in all fields", comment: "")
        case .photoNotExit:
            return NSLocalizedString("User did not choose photo", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Can not get user info", comment: "")
        case .cannotUnwrapToHUser:
            return NSLocalizedString("Can not unwrap user data to HUser", comment: "")
        }
    }
}
