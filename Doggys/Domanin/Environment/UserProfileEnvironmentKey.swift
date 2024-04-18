//
//  UserViewModelEnvironmentKey.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import SwiftUI

struct UserViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: UserProfileProtocol = FirebaseUserProfileViewModel()
}

extension EnvironmentValues {
    var userViewModel: UserProfileProtocol {
        get { self[UserViewModelEnvironmentKey.self]}
        set { self[UserViewModelEnvironmentKey.self] = newValue }
    }
}
