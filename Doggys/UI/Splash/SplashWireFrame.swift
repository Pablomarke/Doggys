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
        let viewModel: SplashViewModel = SplashViewModel()
        var viewController = SplashView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel() -> SplashViewModel {
        return SplashViewModel()
    }
}

