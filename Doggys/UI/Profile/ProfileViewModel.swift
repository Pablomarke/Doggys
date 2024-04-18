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
    private var storageViewModel: StorageProtocol
    @Published var dogOwner: String = "Nombre del Humano"
    @Published var nameOfDog: String = "Doggy Nombre"
    @Published var ageOfDog: String = "Doggy Años"
    @Published var selectedBreed: RazaPerro = .mestizo
    @Published var selectedGender: GeneroPerro = .hembra
    @Published var selectedWalk: PaseoPerro = .corto
    @Published var dofFriendly: PerroAmigable = .si
    @Published var selectedImage: UIImage?
    @Published var urlImage: String = ""
    
    init(userViewModel: UserProfileProtocol, logViewModel:LogProtocol, storageViewModel: StorageProtocol) {
        self.userViewModel = userViewModel
        self.logViewModel = logViewModel
        self.storageViewModel = storageViewModel
    }
    
    func searchImageOnRB() {
        guard let selectedImage = selectedImage else { return }
        guard let imageData = selectedImage.jpegData(compressionQuality: 0.1) else { return }
        guard let compressedImage = UIImage(data: imageData) else {return}
        
        storageViewModel.uploadImage(image: compressedImage) { url in
            self.urlImage = url
        } onFailure: { error in
            print("Error: \(error)")
        }
    }
    
    func searchDataOnDB() {
        let data = UserProfile(id: UUID().uuidString, imageProfile: self.urlImage, humanName: self.dogOwner, dogName: self.nameOfDog, dogYears: self.ageOfDog, dogGender: self.selectedGender, dogWalk: self.selectedWalk, dogFriendly: self.dofFriendly)
        
        userViewModel.searchData(userProfile: data) {
            print("Document added succesfully")
        } onFailure: { error in
            print("Error: \(error)")
        }
    }
}
