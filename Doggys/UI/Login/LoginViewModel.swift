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
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: Preferences.userLoggedIn)
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var rememberLogin: Bool = false
    @Published var navigateToHome: Bool = false
    @Published var isLoading: Bool = false
    
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
                self?.navigateToHome = loggedIn
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
    
    func loginUser() {
        isLoading = true
        
        self.authViewModel.login(email: self.email, password: self.password,
                                 onSuccess: { [weak self] user in
            self?.logViewModel.log(screen: LoginView.viewName,
                                   action: "USER_LOGGED_IN")
            self?.isLoggedIn = true
            self?.isLoading = false
        },
                                 onFailure: { [weak self] error in
            self?.logViewModel.crash(screen: LoginView.viewName,
                                     exception: error)
            self?.alertMessage = error.localizedDescription
            self?.showAlert = true
            self?.isLoading = false
        }
        )
    }
    
    func rememberLoginAndPasswordInKeyChainAndPreferences() {
        if rememberLogin {
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.userLoggedIn)
            keyChain.setStringKey(value: email,
                                  key: KeyChainEnum.user)
            keyChain.setStringKey(value: password,
                                  key: KeyChainEnum.password)
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.rememberLogin)
        } else {
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.rememberLogin)
            UserDefaults.standard.set(rememberLogin,
                                      forKey: Preferences.userLoggedIn)
            
        }
    }
}
