//
//  SettingsViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 11/4/24.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    //MARK: - Properties -
    private var keyChain: KeyChainDataProvider
    @Published var isLogOut: Bool = false

    init(keyChain: KeyChainDataProvider) {
        self.keyChain = keyChain
    }
    
    //MARK: - Publics Methods -
    func disconnect() {
        keyChain.allKeysDelete()
        UserDefaults.standard.set(false,
                                  forKey: Preferences.rememberLogin)
        isLogOut = true
    }
}
