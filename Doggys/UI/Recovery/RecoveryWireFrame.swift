//
//  RecoveryWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 4/4/24.
//

import SwiftUI

final class RecoveryWireFrame: BaseWireframe {
    //MARK: Public Methods
    var viewController: AnyView {
        let authViewModel: AuthProtocol = createAutViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let viewModel: RecoveryPasswordViewModel = createViewModel(authViewModel: authViewModel, logViewModel: logViewModel)
        var viewController = RecoveryPasswordView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(authViewModel: AuthProtocol, 
                                 logViewModel: LogProtocol) -> RecoveryPasswordViewModel {
        return RecoveryPasswordViewModel(logViewModel: logViewModel,
                                         authViewModel: authViewModel)
    }
}
