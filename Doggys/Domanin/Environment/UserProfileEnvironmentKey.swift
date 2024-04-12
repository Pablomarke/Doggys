//
//  UserProfileEnvironmentKey.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import SwiftUI

struct UserProfileEnvironmentKey: EnvironmentKey {
    static let defaultValue: UserProfileProtocol = FirebaseUserProfileViewModel()
}

extension EnvironmentValues {
    var userProfileViewModel
