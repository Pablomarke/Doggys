//
//  UserProfileProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import Foundation
import Combine

protocol UserProfileProtocol {
    func fetchData() -> AnyPublisher<UsersProfileList, Error>
    
    func searchData(userProfile: UserProfile,
                    onSuccess: @escaping () -> Void, 
                    onFailure: @escaping (Error) -> Void)
}
