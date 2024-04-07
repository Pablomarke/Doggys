//
//  RegisterWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 3/4/24.
//

import SwiftUI

final class RegisterWireFrame {
    //MARK: Public Methods
    var viewController: AnyView {
        let authViewModel: AuthProtocol = createAutViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let viewModel: RegisterViewModel = createViewModel(authViewModel: authViewModel, 
                                                           logViewModel: logViewModel)
        var viewController = RegisterView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(authViewModel: AuthProtocol, logViewModel: LogProtocol) -> RegisterViewModel {
        return RegisterViewModel(logViewModel: logViewModel, 
                                 authViewModel: authViewModel)
    }
    
    private func createAutViewModel() -> AuthProtocol {
        return FirebaseAuthViewModel()
    }
    
    private func createLogViewModel() -> LogProtocol {
        return FirebaseLogViewModel()
    }
}
