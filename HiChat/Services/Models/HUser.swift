//
//  HUser.swift
//  HiChat
//
//  Created by Artem Tkachev on 28.01.24.
//

import UIKit
import FirebaseFirestore

struct HUser: Hashable, Decodable {
    var userName: String
    var email: String
    var userAvatarString: String
    var description: String
    var sex: String
    var id: String
    
    init(userName: String, email: String, userAvatarString: String, description: String, sex: String, id: String) {
        self.userName = userName
        self.email = email
        self.id = id
        self.description = description
        self.sex = sex
        self.userAvatarString = userAvatarString
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil}
        guard let userName = data["userName"] as? String,
              let email = data["email"] as? String,
              let id = data["id"] as? String,
              let description = data["description"] as? String,
              let sex = data["sex"] as? String,
              let userAvatarString = data["userAvatarString"] as? String else { return nil}
        
        self.userName = userName
        self.email = email
        self.id = id
        self.description = description
        self.sex = sex
        self.userAvatarString = userAvatarString
    }
    
    var representation: [String: Any] {
        var rep = ["id": id]
        rep ["userName"] = userName
        rep ["email"] = email
        rep ["description"] = description
        rep ["sex"] = sex
        rep ["userAvatarString"] = userAvatarString
        return rep
    }
    
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
