//
//  HChat.swift
//  HiChat
//
//  Created by Artem Tkachev on 28.01.24.
//

import UIKit

struct HChat: Hashable, Decodable {
    var userName: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: HChat, rhs: HChat) -> Bool {
        return lhs.id == rhs.id
    }
}
