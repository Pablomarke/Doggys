//
//  SettingsViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 11/4/24.
//

import Foundation
import MessageUI

final class SettingsViewModel: ObservableObject {
    //MARK: - Properties -
    private var keyChain: SecureDataProviderProtocol
    @Published var isLogOut: Bool = false
    @Published var isMailAvailable = false
    
    init(keyChain: SecureDataProviderProtocol) {
        self.keyChain = keyChain
    }
    
    //MARK: - Publics Methods -
    func disconnect() {
        keyChain.allKeysDelete()
        UserDefaults.standard.set(false,
                                  forKey: Preferences.rememberLogin)
        UserDefaults.standard.set(false,
                                  forKey: Preferences.userLoggedIn)
        isLogOut = true
    }
    
    func checkMailAvailability() {
          self.isMailAvailable = MFMailComposeViewController.canSendMail()
      }
}
