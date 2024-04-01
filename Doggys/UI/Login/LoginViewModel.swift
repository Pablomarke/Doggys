//
//  LoginViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    private var dataManager: LoginDataManager
    
    init(dataManager: LoginDataManager) {
        self.dataManager = dataManager
    }
}
