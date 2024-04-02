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
    @Published var email = "e-mail"
    @Published var password = "password"
    @Published var isLoggedIn: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""

    init(dataManager: LoginDataManager, authViewModel: AuthProtocol, logViewModel: LogProtocol) {
        self.dataManager = dataManager
        self.authViewModel = authViewModel
        self.logViewModel = logViewModel
    }
    
    //MARK: Publics Methods
    func initAnalyticsFirebase() {
        Analytics.logEvent("Entro a la app",
                           parameters: ["message":"Arranca la app"])
    }
    
    func checkIfUserIsLoggedIn() {
        authViewModel.isUserLoggedIn(
            onSuccess: { [weak self] loggedIn in
                self?.isLoggedIn = loggedIn
            },
            onFailure: { [weak self] error in
                self?.logViewModel.crash(screen: LoginView.viewName,
                                   exception: error)
            }
        )
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
