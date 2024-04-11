//
//  SettingsWireframe.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 11/4/24.
//

import Foundation

import SwiftUI

final class SettingsWireframe {
    //MARK: Public Methods
    var viewController: AnyView {
        let keyChain: KeyChainDataProvider = createkeyChain()
        let viewModel: SettingsViewModel = SettingsViewModel(keyChain: keyChain)
        var viewController = SettingsView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(with keyChain: KeyChainDataProvider) -> SettingsViewModel {
        return SettingsViewModel(keyChain: keyChain)
    }
    
    private func createkeyChain() -> KeyChainDataProvider {
        return KeyChainDataProvider()
    }
}
