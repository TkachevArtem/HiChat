//
//  FirestoreService.swift
//  HiChat
//
//  Created by Artem Tkachev on 29.02.24.
//

import FirebaseCore
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<HUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let hUser = HUser(userName: username!, email: email, userAvatarString: "not exist", description: description!, sex: sex!, id: id)
        self.usersRef.document(hUser.id).setData(hUser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(hUser))
            }
        }
    }
}
