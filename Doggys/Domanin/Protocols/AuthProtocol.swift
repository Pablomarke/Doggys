//
//  AuthProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

import Foundation
import Combine

protocol AuthProtocol {
    func login(email: String,
                      password: String) -> AnyPublisher<User, Error>
    
    func register(email: String,
                  password: String) -> AnyPublisher<User, Error>
                  
  //  func isUserLoggedInCombine() -> AnyPublisher<Bool, Error>
    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void,
                        onFailure: @escaping (Error) -> Void)
    
    func recoverPassword(email: String) -> AnyPublisher<Void, Error>
    
//    func getUserCombine() -> AnyPublisher<User, Error>
    func getUser(onSuccess: @escaping (User) -> Void,
                 onFailure: @escaping (Error) -> Void)
    
 //   func logOutCombine() -> AnyPublisher<Void, Error>
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error) -> Void)
}
