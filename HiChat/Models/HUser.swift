//
//  HUser.swift
//  HiChat
//
//  Created by Artem Tkachev on 28.01.24.
//

import UIKit

struct HUser: Hashable, Decodable {
    var userName: String
    var userAvatarString: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: HUser, rhs: HUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return userName.lowercased().contains(lowercasedFilter)
    }
}
