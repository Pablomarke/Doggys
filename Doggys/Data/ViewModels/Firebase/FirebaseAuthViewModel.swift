//
//  FirebaseAuthViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

import Foundation
import FirebaseAuth
import Combine

class FirebaseAuthViewModel: AuthProtocol {
    func login(email: String,
               password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            Auth.auth().signIn(withEmail: email,
                               password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let authResult = result {
                    let id = authResult.user.uid
                    let user = User(id: id,
                                    email: email,
                                    password: "")
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func register(email: String,
                  password: String) -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            Auth.auth().createUser(withEmail: email,
                                   password: password) { result, error in
                if let error = error {
                    promise(.failure(error))
                } else if let authResult = result {
                    let id = authResult.user.uid
                    let user = User(id: id,
                                    email: email,
                                    password: "")
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func recoverPassword(email: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success({}()))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func isUserLoggedIn() -> AnyPublisher<Bool, Error> {
        Future<Bool, Never> { promise in
            promise(.success(Auth.auth().currentUser != nil))
        }
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    func getUser(onSuccess: @escaping (User) -> Void,
                 onFailure: @escaping (Error) -> Void) {
        
        if let user = Auth.auth().currentUser {
            onSuccess(User(id: user.uid,
                           email: user.email ?? "",
                           password: ""))
        } else {
            onFailure(NSError(domain: "",
                              code: -1))
        }
    }
    
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error) -> Void) {
        do {
            try Auth.auth().signOut()
            onSuccess()
        } catch let signOutError {
            onFailure(signOutError)
        }
    }
}
