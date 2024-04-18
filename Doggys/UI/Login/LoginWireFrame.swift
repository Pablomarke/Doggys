//
//  LoginWireFrame.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import SwiftUI

final class LoginWireFrame: BaseWireframe {
    //MARK: Public Methods
    var viewController: AnyView {
        let apiClient: LoginAPIClient = LoginAPIClient()
        let dataManager: LoginDataManager = createDataManager(apiClient: apiClient)
        let authViewModel: AuthProtocol = createAutViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let keyChain: KeyChainDataProvider = createkeyChain()
        let viewModel: LoginViewModel = createViewModel(with: dataManager,
                                                         authViewModel: authViewModel,
                                                        logViewModel: logViewModel, 
                                                        keyChain: keyChain)
        var viewController = LoginView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(with dataManager: LoginDataManager,
                                 authViewModel: AuthProtocol,
                                 logViewModel: LogProtocol,
                                 keyChain: KeyChainDataProvider) -> LoginViewModel {
        return LoginViewModel(dataManager: dataManager,
                              authViewModel: authViewModel,
                              logViewModel: logViewModel, 
                              keyChain: keyChain)
    }
    
    private func createDataManager(apiClient: LoginAPIClient) -> LoginDataManager {
        let dataManager = LoginDataManager(apiClient: apiClient)
        return dataManager
    }
}
