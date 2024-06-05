//
//  FirebaseStorageViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 17/4/24.
//

import SwiftUI
import FirebaseStorage
import Combine

class FirebaseStorageViewModel: StorageProtocol {
    func uploadImage(image: UIImage) -> AnyPublisher<String, Error> {
        Future<String, Error> { promise in
            guard let imageData = image.jpegData(compressionQuality: 0.1) else {
                print("error compression")
                return
            }
            
            let storage = Storage.storage()
            let storageRef = storage.reference()
            let imageName = "\(UUID().uuidString).png"
            let imageRef = storageRef.child(imageName)
            imageRef.putData(imageData) { data, error in
                if let error = error {
                    promise(.failure(error))
                } else if let data = data {
                    imageRef.downloadURL { url, error in
                        if let error = error {
                            promise(.failure(error))
                        } else if let url = url {
                            promise(.success(url.absoluteString))
                        }
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
