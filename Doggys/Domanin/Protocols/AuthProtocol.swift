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
    
    func isUserLoggedIn() -> AnyPublisher<Bool, Error>
    
    func recoverPassword(email: String) -> AnyPublisher<Void, Error>
    
    func logOut() -> AnyPublisher<Void, Error>
    
    func getUser() -> AnyPublisher<User, Error>
}
