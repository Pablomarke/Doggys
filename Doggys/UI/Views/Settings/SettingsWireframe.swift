//
//  SettingsWireframe.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 11/4/24.
//

import Foundation

import SwiftUI

enum SettingsWireframe{
    static func createView() -> some View {
        let keyChain: KeyChainDataProvider = KeyChainDataProvider()
        let viewModel: SettingsViewModel = SettingsViewModel(keyChain: keyChain)
        let view = SettingsView(viewModel: viewModel)
        return view
    }
}
