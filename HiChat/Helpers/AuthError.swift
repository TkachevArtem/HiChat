//
//  AuthError.swift
//  HiChat
//
//  Created by Artem Tkachev on 28.02.24.
//

import Foundation

enum AuthError {
    case notFilled
    case ivalidEmail
    case passwordNotMatched
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Please fill in all fields", comment: "")
        case .ivalidEmail:
            return NSLocalizedString("Invalid mail format", comment: "")
        case .passwordNotMatched:
            return NSLocalizedString("Passwords don't match", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
}
