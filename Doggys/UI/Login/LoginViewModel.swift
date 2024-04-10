//
//  LoginViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import Foundation
import FirebaseAnalytics

final class LoginViewModel: ObservableObject {
    //MARK: Properties
    private var dataManager: LoginDataManager
    private var authViewModel: AuthProtocol
    private var logViewModel: LogProtocol
    private var keyChain: KeyChainDataProvider
    @Published var email: String = "e-mail"
    @Published var password: String = "password"
    @Published var isLoggedIn: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var rememberLogin: Bool = false
    
    init(dataManager: LoginDataManager,
         authViewModel: AuthProtocol,
         logViewModel: LogProtocol,
         keyChain: KeyChainDataProvider) {
        self.dataManager = dataManager
        self.authViewModel = authViewModel
        self.logViewModel = logViewModel
        self.keyChain = keyChain
    }
    
    //MARK: Publics Methods
    func initAnalyticsFirebase(text: String, message: String) {
        Analytics.logEvent(text,
                           parameters: ["message":message])
    }
    
    func checkIfUserIsLoggedIn() {
        authViewModel.isUserLoggedIn(
            onSuccess: { [weak self] loggedIn in
                //TODO: This is the real way to navigate and pass the data
                // self?.isLoggedIn = loggedIn
                // print(loggedIn)
                self?.isLoggedIn = true
                if loggedIn {
                    self?.initAnalyticsFirebase(text: "Enter app",
                                                message: "Enter app")
                    self?.rememberLoginAndPasswordInKeyChainAndPreferences()
                }
            },
            onFailure: { [weak self] error in
                self?.logViewModel.crash(screen: LoginView.viewName,
                                         exception: error)
            }
        )
    }
    
    func rememberLoginAndPasswordInKeyChainAndPreferences() {
        if rememberLogin {
            keyChain.setStringKey(value: email,
                                  key: KeyChainEnum.user)
            keyChain.setStringKey(value: password,
                                  key: KeyChainEnum.password)
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.rememberLogin)
        } else {
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.rememberLogin)
        }
    }
    
    func registerUser() {
        authViewModel.register(email: email,
                               password: password,
                               onSuccess: { [weak self] user in
            self?.logViewModel.log(screen: LoginView.viewName,
                                   action: "USER_REGISTERED")
        },
                               onFailure: { [weak self] error in
            print(error.localizedDescription)
            self?.alertMessage = error.localizedDescription
            self?.showAlert = true
        })
    }
}
