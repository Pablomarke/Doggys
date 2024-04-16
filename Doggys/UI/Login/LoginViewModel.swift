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
    
    func checkIfUserIsLoggedIn() {
        // self.navigateToHome = false
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
        authViewModel.login(email: email,
                            password: password,
                            onSuccess: { [weak self] user in
            print(user)
            
            self?.navigateToHome = true
            self?.initAnalyticsFirebase(text: "Enter app",
                                        message: "Enter app")
            self?.rememberLoginAndPasswordInKeyChainAndPreferences()
            
            
            self?.logViewModel.log(screen: LoginView.viewName,
                                   action: "USER_LOGGED_IN")
            self?.isLoggedIn = true
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
        rememberLoginAndPassword(remember: rememberLogin)
        if rememberLogin {
            keyChain.setLoginAndPassword(user: email,
                                         password: password)
        }
    }
    
    /*
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
     }*/
}

private extension LoginViewModel {
    func rememberLoginAndPassword(remember: Bool) {
        UserDefaults.standard.set(remember,
                                  forKey: Preferences.rememberLogin)
        UserDefaults.standard.set(remember,
                                  forKey: Preferences.userLoggedIn)
    }
}
