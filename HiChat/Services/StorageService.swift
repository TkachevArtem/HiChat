//
//  StorageService.swift
//  HiChat
//
//  Created by Artem Tkachev on 5.03.24.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class StorageService {
    
    private static let shared = StorageService()
    
    let storageRef = Storage.storage().reference()
    
    private var avatarsRef: StorageReference {
        return storageRef.child("avatars")
    }
    
    func upload(photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        
    }
    
}
