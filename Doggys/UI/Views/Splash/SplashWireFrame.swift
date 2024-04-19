//
//  SplashWireFrame.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import SwiftUI

final class SplashWireFrame: BaseWireframe {
    //MARK: Public Methods
    var viewController: AnyView {
        let authViewModel: AuthProtocol = createAutViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let viewModel: SplashViewModel = SplashViewModel(authViewModel: authViewModel,
                                                         logViewModel: logViewModel)
        var viewController = SplashView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(logViewModel: LogProtocol,
                                 authViewModel: AuthProtocol) -> SplashViewModel {
        return SplashViewModel(authViewModel: authViewModel,
                               logViewModel: logViewModel)
    }
}
