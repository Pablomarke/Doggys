//
//  LoginViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import Foundation

final class LoginViewModel: BaseViewModel {
    //MARK: Properties
    private var authViewModel: AuthProtocol
    private var logViewModel: LogProtocol
    private var keyChain: SecureDataProviderProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: Preferences.userLoggedIn)
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var rememberLogin: Bool = false
    @Published var navigateToHome: Bool = false
    @Published var isLoading: Bool = false
    
    init(authViewModel: AuthProtocol,
         logViewModel: LogProtocol,
         keyChain: SecureDataProviderProtocol) {
        self.authViewModel = authViewModel
        self.logViewModel = logViewModel
        self.keyChain = keyChain
    }
    
    //MARK: Publics Methods
    func loginUser() {
        isLoading = true
        authViewModel.login(email: email,
                            password: password,
                            onSuccess: { [weak self] user in
            self?.logViewModel.log(screen: LoginView.viewName,
                                   action: "USER_LOGGED_IN")
            self?.navigateToHomeWithLogin()
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
    
    func rememberLogin(remember: Bool) {
        rememberLogin = remember
        UserDefaults.standard.set(remember,
                                  forKey: Preferences.rememberLogin)
    }
}

private extension LoginViewModel {
    func rememberLoginAndPasswordInKeyChainAndPreferences() {
        rememberLoginAndPassword(remember: UserDefaults.standard.bool(forKey: Preferences.rememberLogin))
    }
    
    func navigateToHomeWithLogin() {
        navigateToHome = true
        isLoggedIn = true
        isLoading = false
        rememberLoginAndPasswordInKeyChainAndPreferences()
        initAnalyticsFirebase(text: "Enter app",
                              message: "Enter app")
    }
    
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
