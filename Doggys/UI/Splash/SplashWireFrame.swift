//
//  SplashWireFrame.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import SwiftUI

final class SplashWireFrame {
    //MARK: Public Methods
    var viewController: AnyView {
        let authViewModel: AuthProtocol = createAutViewModel()
        let keyChain: KeyChainDataProvider = createkeyChain()
        let viewModel: SplashViewModel = SplashViewModel(authViewModel: authViewModel,
                                                         keyChain: keyChain)
        var viewController = SplashView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(authViewModel: AuthProtocol,
                                 keyChain: KeyChainDataProvider) -> SplashViewModel {
        return SplashViewModel(authViewModel: authViewModel,
                               keyChain: keyChain)
    }
    
    private func createAutViewModel() -> AuthProtocol {
        return FirebaseAuthViewModel()
    }
    
    private func createkeyChain() -> KeyChainDataProvider {
        return KeyChainDataProvider()
    }
}
