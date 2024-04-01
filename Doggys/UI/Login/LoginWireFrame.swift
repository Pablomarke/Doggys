//
//  LoginWireFrame.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import SwiftUI

final class LoginWireFrame {
    //MARK: Properties
    
    //MARK: Public Methods
    var viewController: AnyView {
        let apiClient = LoginAPIClient()
        let dataManager: LoginDataManager = createDataManager(apiClient: apiClient)
        let viewModel: LoginViewModel = createViewModel(with: dataManager)
        var viewController = LoginView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(with dataManager: LoginDataManager) -> LoginViewModel {
        return LoginViewModel(dataManager: dataManager)
    }
    
    private func createDataManager(apiClient: LoginAPIClient) -> LoginDataManager {
        let dataManager = LoginDataManager(apiClient: apiClient)
        return dataManager
    }
}
