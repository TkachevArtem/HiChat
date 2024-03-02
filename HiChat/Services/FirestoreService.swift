//
//  FirestoreService.swift
//  HiChat
//
//  Created by Artem Tkachev on 29.02.24.
//

import Firebase
import FirebaseCore
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
//    func getUserData(user: User, completion: @escaping (Result<HUser, Error>) -> Void) {
//        let docRef = usersRef.document(user.uid)
//        docRef.getDocument { document, error in
//            if let document = document, document.exists {
//                guard let hUser = HUser(document: document) else {
//                    completion(.failure(UserError.cannotUnwrapToHUser))
//                    return
//                }
//                completion(.success(hUser))
//                print("User: \(hUser)")
//            } else {
//                completion(.failure(UserError.cannotGetUserInfo))
//                print("Xyi")
//            }
//        }
//    }
    
    func getUserData(user: User, completion: @escaping (Result<HUser, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let hUser = HUser(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToHUser))
                    return
                }
                completion(.success(hUser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
                print("i tyt xyi")
            }
        }
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<HUser, Error>) -> Void) {
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        let hUser = HUser(userName: username!, email: email, userAvatarString: "not exist", description: description!, sex: sex!, id: id)
        self.usersRef.addDocument(data: hUser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(hUser))
            }
        }
    }
    
    func saveDataTest() {
        usersRef.addDocument(data: ["Test" : "Test", "Num" : "Num", "Int" : 123])
    }
}
