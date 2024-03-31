//
//  AuthViewModelEnvironmentKey.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

import SwiftUI

struct AuthViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: AuthProtocol = FirebaseAuthViewModel()
}

extension EnvironmentValues {
    var authViewModel: AuthProtocol {
        get { self[AuthViewModelEnvironmentKey.self] }
        set { self[AuthViewModelEnvironmentKey.self] = newValue }
    }
}
