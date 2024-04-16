//
//  ProfileViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import Foundation
import SwiftUI
import Firebase
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
    
    func searchDataOnDB() {
        let db = Firestore.firestore()
        let exampleModel = UserProfile(id: UUID().uuidString, humanName: self.dogOwner, dogName: self.nameOfDog, dogYears: self.ageOfDog, dogGender: self.selectedGender, dogWalk: self.selectedWalk, dogFriendly: self.dofFriendly)
        db.collection("example").addDocument(data: [
            "id": exampleModel.id,
            "name": exampleModel.humanName,
            "dogName": exampleModel.dogName,
            "dogYears": exampleModel.dogYears,
            "dogGender": exampleModel.dogGender,
            "dogWalk": exampleModel.dogWalk,
            "dogFriendly": exampleModel.dogFriendly
        ]) { error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Document added succesfull")
            }
            
        }
    }
}
