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
    
    func getUser() -> AnyPublisher<User, Error> {
        Future<User, Error> { promise in
            if let authResult = Auth.auth().currentUser {
                let id = authResult.uid
                let user = User(id: id,
                                email: authResult.email ?? "",
                                password: "")
                promise(.success(user))
            } else {
                let error = NSError(domain: "FirebaseAuthError",
                                    code: -1,
                                    userInfo: [NSLocalizedDescriptionKey: "No user is currently logged in."])
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func logOut() -> AnyPublisher<Void, Error> {
        Future<Void, Never> { promise in
            do {
                try Auth.auth().signOut()
            } catch let signOutError {
            }
        }
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
