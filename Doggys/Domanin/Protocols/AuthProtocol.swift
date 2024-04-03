//
//  AuthProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

import Foundation

protocol AuthProtocol {
    func register(email: String, 
                  password: String,
                  onSuccess: @escaping (User) -> Void, 
                  onFailure: @escaping (Error) -> Void)
    
    func login(email: String,
               password: String, onSuccess: @escaping (User) -> Void,
               onFailure: @escaping (Error) -> Void)
    
    func isUserLoggedIn(onSuccess: @escaping (Bool) -> Void,
                        onFailure: @escaping (Error) -> Void)
    
    func recoverPassword(email: String,
                         onSuccess: @escaping () -> Void,
                         onFailure: @escaping (Error) -> Void)
    
    func getUser(onSuccess: @escaping (User) -> Void,
                 onFailure: @escaping (Error) -> Void)
    
    func logout(onSuccess: @escaping () -> Void,
                onFailure: @escaping (Error) -> Void)
}
