//
//  ProfileViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI
import Combine
import MapKit

final class ProfileViewModel: BaseViewModel {
    //MARK: Properties
    private var userViewModel: UserProfileProtocol
    private var logViewModel: LogProtocol
    private var storageViewModel: StorageProtocol
    private var locationManager: GpsLocationManagerProtocol
    
    @Published var dogOwner: String = ""
    @Published var nameOfDog: String = ""
    @Published var ageOfDog: String = ""
    @Published var selectedBreed: DogBreed = .mestizo
    @Published var selectedGender: DogGender = .female
    @Published var selectedWalk: DogWalkLong = .short
    @Published var dofFriendly: DogFriendly = .yes
    @Published var selectedImage: UIImage?
    @Published var urlImage: String = ""
    @Published var selfLatitude: Double = .init()
    @Published var selfLongitude: Double = .init()
    @Published var navigateToHome: Bool = false
    @Published var isLoading: Bool = false
    
    init(userViewModel: UserProfileProtocol,
         logViewModel: LogProtocol,
         storageViewModel: StorageProtocol,
         locationManager: GpsLocationManagerProtocol) {
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
        
        storageViewModel.uploadImage(image: compressedImage) 
            .sink { completion in
                print(completion)
            } receiveValue: { url in
                self.urlImage = url
                self.getLocationAndSaveData()
            }
            .store(in: &cancellables)
    }
    
    func getLocation() {
        let location = self.locationManager.getLocation()
            .receive(on: DispatchQueue.main)
            .sink { coordinate in
                self.selfLatitude = coordinate.latitude
                self.selfLongitude = coordinate.longitude
            }
    }
    
    func getLocationAndSaveData() {
        locationManager.getLocation()
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("Location ok")
                    case .failure(let error):
                        print("Error getting location: \(error)")
                }
            }, receiveValue: { coordinate in
                self.selfLatitude = coordinate.latitude
                self.selfLongitude = coordinate.longitude
                self.searchDataOnDataBase()
            })
            .store(in: &cancellables)
    }
    
    func searchDataOnDataBase() {
        let data = UserProfile(imageProfile: self.urlImage,
                               humanName: self.dogOwner,
                               dogName: self.nameOfDog,
                               dogYears: self.ageOfDog,
                               dogBreed: self.selectedBreed,
                               dogGender: self.selectedGender,
                               dogWalk: self.selectedWalk,
                               dogFriendly: self.dofFriendly,
                               selfLatitude: self.selfLatitude,
                               selfLongitude: self.selfLongitude)
        
        userViewModel.searchData(userProfile: data)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print(self.selfLatitude)
                    case .failure(let error):
                        print("Error saving data: \(error)")
                }
            }, receiveValue: {
                print("Document added succesfully")
            })
            .store(in: &cancellables)
    }
}
