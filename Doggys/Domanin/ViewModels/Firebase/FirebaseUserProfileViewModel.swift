//
//  FirebaseUserProfileViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import FirebaseFirestore

class FirebaseUserProfileViewModel: UserProfileProtocol {
    private let db = Firestore.firestore()
    private let collectionName = "userprofile_doggys"
    
    func fetchData(onSucces: @escaping (UsersProfileList) -> Void,
                   onFailure: @escaping (Error) -> Void) {
        db.collection(collectionName)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    onFailure(error)
                } else if let querySnapshot = querySnapshot {
                    var data: UsersProfileList = []
                    for document in querySnapshot.documents {
                        do {
                            let userProfile = try document.data(as: UserProfile.self)
                            data.append(userProfile)
                        } catch {
                            onFailure(error)
                            return
                        }
                    }
                    onSucces(data)
                }
            }
    }
    
    func searchData(userProfile: UserProfile,
                    onSuccess: @escaping () -> Void,
                    onFailure: @escaping (Error) -> Void) {
        db.collection(collectionName)
            .addDocument(data: userProfile.dictionary) { error in
                if let error = error {
                    onFailure(error)
                } else {
                    onSuccess()
                }
            }
    }
}
