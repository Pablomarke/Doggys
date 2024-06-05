//
//  FirebaseUserProfileViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import FirebaseFirestore
import Combine

class FirebaseUserProfileViewModel: UserProfileProtocol {
    private let dataBase = Firestore.firestore()
    private let collectionName = "userprofile_doggys"
    
    func fetchData() -> AnyPublisher<UsersProfileList, Error> {
        Future<UsersProfileList, Error> { promise in
            self.dataBase.collection(self.collectionName)
                .addSnapshotListener { querySnapshot, error in
                    if let error = error {
                        promise(.failure(error))
                    } else if let querySnapshot = querySnapshot {var data: UsersProfileList = []
                        for document in querySnapshot.documents {
                            do {
                                let userProfile = try document.data(as: UserProfile.self)
                                data.append(userProfile)
                            } catch {
                                return
                            }
                        }
                        promise(.success(data))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
    
    func searchData(userProfile: UserProfile) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { [self] promise in
            dataBase.collection(self.collectionName)
                .addDocument(data: userProfile.dictionary) { error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
