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
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: Preferences.userLoggedIn)
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var rememberLogin: Bool = false
    @Published var navigateToHome: Bool = false
    
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

    func loginUser() {
        authViewModel.login(email: email,
                            password: password,
                            onSuccess: { [weak self] user in
            self?.navigateToHome = true
            self?.initAnalyticsFirebase(text: "Enter app",
                                        message: "Enter app")
            self?.logViewModel.log(screen: LoginView.viewName,
                                   action: "USER_LOGGED_IN")
            self?.isLoggedIn = true
            self?.rememberLoginAndPasswordInKeyChainAndPreferences()

        },
                            onFailure: { [weak self] error in
            self?.logViewModel.crash(screen: LoginView.viewName,
                                     exception: error)
            self?.alertMessage = error.localizedDescription
            self?.showAlert = true
        }
        )
    }
    
    func rememberLoginAndPasswordInKeyChainAndPreferences() {
        rememberLoginAndPassword(remember: UserDefaults.standard.bool(forKey: Preferences.rememberLogin))
    }
}

private extension LoginViewModel {
    func rememberLoginAndPassword(remember: Bool) {
        UserDefaults.standard.set(remember,
                                  forKey: Preferences.rememberLogin)
        if remember {
            keyChain.setLoginAndPassword(user: email,
                                         password: password)
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.userLoggedIn)
        }
    }
}
