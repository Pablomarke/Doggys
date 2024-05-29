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
import Combine

final class ProfileViewModel: ObservableObject {
    //MARK: Properties
    private var userViewModel: UserProfileProtocol
    private var logViewModel: LogProtocol
    private var storageViewModel: StorageProtocol
    private var locationManager: GpsLocationManager
    
    @Published var isButtonDisabled: Bool = true

    @Published var dogOwner: String = ""
    @Published var nameOfDog: String = ""
    @Published var ageOfDog: String = ""
    @Published var selectedBreed: DogBreed = .none
    @Published var selectedGender: DogGender = .none
    @Published var selectedWalk: DogWalkLong = .none
    @Published var dofFriendly: DogFriendly = .none
    @Published var selectedImage: UIImage?
    @Published var urlImage: String = ""
    @Published var selfLatitude: Double = 20.00
    @Published var selfLongitude: Double = 20.00
    @Published var navigateToHome: Bool = true
    @Published var isLoading: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userViewModel: UserProfileProtocol,
         logViewModel: LogProtocol,
         storageViewModel: StorageProtocol,
         locationManager: GpsLocationManager) {
        self.userViewModel = userViewModel
        self.logViewModel = logViewModel
        self.storageViewModel = storageViewModel
        self.locationManager = locationManager
        
        Publishers.CombineLatest3($dogOwner, $nameOfDog, $ageOfDog)
            .map { dogOwner, nameOfDog, ageOfDog in
                return dogOwner.isEmpty || nameOfDog.isEmpty || ageOfDog.isEmpty
            }
            .assign(to: \.isButtonDisabled, on: self)
            .store(in: &cancellables)
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
    
//    func validateFields(dogOwner: String, nameOfDog: String, ageOfDog: String) {
//        if dogOwner.isEmpty || nameOfDog.isEmpty || ageOfDog.isEmpty {
//               isButtonDisabled = true
//           } else {
//               isButtonDisabled = false
//           }
//       }
}
