//
//  UserProfileProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import Foundation

protocol UserProfileProtocol {
    func fetchData(onSucces: @escaping ([UserProfile]) -> Void, onFailure: @escaping (Error) -> Void)
    func searchData(userProfile: UserProfile, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void)
}
