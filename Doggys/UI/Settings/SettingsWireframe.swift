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
        let viewModel: SettingsViewModel = SettingsViewModel()
        var viewController = SettingsView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel() -> SettingsViewModel {
        return SettingsViewModel()
    }
}
