//
//  ProfileViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseFirestore

final class ProfileViewModel: ObservableObject {
    //MARK: Properties
    private var userViewModel: UserProfileProtocol
    private var logViewModel: LogProtocol
    @Published var dogOwner: String = "Nombre del Humano"
    @Published var nameOfDog: String = "Doggy Nombre"
    @Published var ageOfDog: String = "Doggy Años"
    @Published var selectedBreed: RazaPerro = .mestizo
    @Published var selectedGender: GeneroPerro = .hembra
    @Published var selectedWalk: PaseoPerro = .corto
    @Published var dofFriendly: PerroAmigable = .si
    @Published var selectedImage: UIImage?
    @Published var urlImage: URL?
    
    init(userViewModel: UserProfileProtocol, logViewModel:LogProtocol) {
        self.userViewModel = userViewModel
        self.logViewModel = logViewModel
    }
    
//    func sentDataToDB() {
//        guard let image = self.selectedImage else { return }
//            let data = UserProfile(id: UUID().uuidString,
//                                   imageProfile: image,
//                                   humanName: self.dogOwner,
//                                   dogName: self.nameOfDog,
//                                   dogYears: self.ageOfDog,
//                                   dogGender: self.selectedGender,
//                                   dogWalk: self.selectedWalk,
//                                   dogFriendly: self.dofFriendly)
//        userViewModel.searchData(userProfile: data) {
//            self.logViewModel.log(screen: ProfileView.viewName, action: "SEARCH_DATA")
//        } onFailure: { error in
//            self.logViewModel.crash(screen: ProfileView.viewName, exception: error)
//        }
//    }
    
    func searchImageOnRB() {
        let storageRef = Storage.storage().reference().child("images").child("userImage.jpg")
        guard let selectedImage = selectedImage else { return }
        guard let imageData = selectedImage.jpegData(compressionQuality: 0.1) else { return }
        
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard error == nil else { return }
        }
        storageRef.downloadURL { (url, error) in
            if error != nil {
                print("Error al obtener URL")
                return
            }
            guard let downloadURL = url else { return }
            self.urlImage = downloadURL
        }
    }
    
    func searchDataOnDB() {
        let db = Firestore.firestore()
        
        let data = UserProfile(id: UUID().uuidString, imageProfile: self.urlImage, humanName: self.dogOwner, dogName: self.nameOfDog, dogYears: self.ageOfDog, dogGender: self.selectedGender, dogWalk: self.selectedWalk, dogFriendly: self.dofFriendly)
        
        db.collection("UserData").addDocument(data: [
            "id": data.id,
            "imageProfile": data.imageProfile?.absoluteString ?? "",
            "name": data.humanName,
            "dogName": data.dogName,
            "dogYears": data.dogYears,
            "dogGender": data.dogGender.rawValue,
            "dogWalk": data.dogWalk.rawValue,
            "dogFriendly": data.dogFriendly.rawValue
        ]) { error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Document added succesfully")
            }
        }
    }
}
