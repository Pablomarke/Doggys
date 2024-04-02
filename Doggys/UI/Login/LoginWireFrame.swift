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
        let apiClient: LoginAPIClient = LoginAPIClient()
        let dataManager: LoginDataManager = createDataManager(apiClient: apiClient)
        let authViewModel: AuthProtocol = createAutViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let viewModel: LoginViewModel = createViewModel(with: dataManager,
                                                         authViewModel: authViewModel,
                                                         logViewModel: logViewModel)
        var viewController = LoginView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(with dataManager: LoginDataManager,
                                 authViewModel: AuthProtocol,
                                 logViewModel: LogProtocol) -> LoginViewModel {
        return LoginViewModel(dataManager: dataManager,
                              authViewModel: authViewModel,
                              logViewModel: logViewModel)
    }
    
    private func createDataManager(apiClient: LoginAPIClient) -> LoginDataManager {
        let dataManager = LoginDataManager(apiClient: apiClient)
        return dataManager
    }
    
    private func createAutViewModel() -> AuthProtocol {
        return FirebaseAuthViewModel()
    }
    
    private func createLogViewModel() -> LogProtocol {
        return FirebaseLogViewModel()
    }
}
