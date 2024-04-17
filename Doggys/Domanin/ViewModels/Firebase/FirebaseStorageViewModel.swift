//
//  FirebaseStorageViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 17/4/24.
//

import SwiftUI
import FirebaseStorage

class FirebaseStorageViewModel: StorageProtocol{
    func uploadImage(image: UIImage, onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void) {
        guard let imageData = image.pngData() else {
            onFailure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to comvert image to data"]))
            return
        }
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let imageName = "\(UUID().uuidString).png"
        let imageRef = storageRef.child(imageName)
        
        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                onFailure(error)
            } else {
                imageRef.downloadURL { url, error in
                    if let error = error {
                        onFailure(error)
                    } else if let url = url {
                        onSuccess(url.absoluteString)
                    }
                }
            }
        }
    }
    
    
}
