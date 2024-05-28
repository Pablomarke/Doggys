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
    private var locationManager: GpsLocationManager

    @Published var dogOwner: String = ""
    @Published var nameOfDog: String = ""
    @Published var ageOfDog: String = ""
    @Published var selectedBreed: DogBreed = .mestizo
    @Published var selectedGender: DogGender = .female
    @Published var selectedWalk: DogWalkLong = .short
    @Published var dofFriendly: DogFriendly = .yes
    @Published var selectedImage: UIImage?
    @Published var urlImage: String = ""
    @Published var selfLatitude: Double = 20.00
    @Published var selfLongitude: Double = 20.00
    @Published var navigateToHome: Bool = false
    @Published var isLoading: Bool = false

    init(userViewModel: UserProfileProtocol, 
         logViewModel: LogProtocol,
         storageViewModel: StorageProtocol,
         locationManager: GpsLocationManager) {
        self.userViewModel = userViewModel
        self.logViewModel = logViewModel
        self.storageViewModel = storageViewModel
        self.locationManager = locationManager
    }
    
    func searchImageOnRB() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        guard let imageData = selectedImage.jpegData(compressionQuality: 0.1) else {
            return
        }
        
        guard let compressedImage = UIImage(data: imageData) else {
            return
        }
        
        storageViewModel.uploadImage(image: compressedImage) { url in
            self.urlImage = url
            self.searchDataOnDataBase()
        } onFailure: { error in
            print("Error: \(error)")
        }
    }
    
    func getLocation() {
        let location = self.locationManager.getLocation()
        self.selfLatitude = location.latitude
        self.selfLongitude = location.longitude
    }
    
    func searchDataOnDataBase() {
        let data = UserProfile(//id: UUID().uuidString,
                               imageProfile: self.urlImage,
                               humanName: self.dogOwner,
                               dogName: self.nameOfDog,
                               dogYears: self.ageOfDog,
                               dogBreed: self.selectedBreed,
                               dogGender: self.selectedGender,
                               dogWalk: self.selectedWalk, 
                               dogFriendly: self.dofFriendly,
                               selfLatitude: self.selfLatitude,
                               selfLongitude: self.selfLongitude)
        
        userViewModel.searchData(userProfile: data) {
            print("Document added succesfully")
        } onFailure: { error in
            print("Error: \(error)")
        }
    }
}
