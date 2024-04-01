//
//  LoginDataManager.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import Foundation

final class LoginDataManager {
    //MARK: Properties
    private var apiClient: LoginAPIClient
    
    init(apiClient: LoginAPIClient) {
        self.apiClient = apiClient
    }
}
