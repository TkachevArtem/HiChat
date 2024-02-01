//
//  AuthService.swift
//  HiChat
//
//  Created by Artem Tkachev on 1.02.24.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>)-> Void ) {
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    
}
