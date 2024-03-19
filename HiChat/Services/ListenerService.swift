//
//  ListenerService.swift
//  HiChat
//
//  Created by Artem Tkachev on 19.03.24.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class ListenerService {
    
    static let shared = ListenerService()
    
    private let db = Firestore.firestore()
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    private var currentUserID: String {
        return Auth.auth().currentUser!.uid
    }
    
    func usersObserve(users: [HUser], completion: @escaping (Result<[HUser], Error>)->Void) -> ListenerRegistration? {
        var users = users
        let usersListener = usersRef.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                completion(.failure(error!))
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                guard let hUser = HUser(document: diff.document) else { return }
                switch diff.type {
                case .added:
                    guard !users.contains(hUser) else { return }
                    guard hUser.id != self.currentUserID else { return }
                    users.append(hUser)
                case .modified:
                    guard let index = users.firstIndex(of: hUser) else { return }
                    users[index] = hUser
                case .removed:
                    guard let index = users.firstIndex(of: hUser) else { return }
                    users.remove(at: index)
                }
            }
            completion(.success(users))
        }
        return usersListener
    }
    
}
