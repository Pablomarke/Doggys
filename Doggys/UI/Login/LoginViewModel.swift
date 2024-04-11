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
    @Published var isLoading: Bool = false

    //MARK: Init
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
        isLoading = true
        
        authViewModel.isUserLoggedIn(
            onSuccess: { [weak self] loggedIn in
               //TODO: This is the real way to navigate and pass the data
                // self?.isLoggedIn = loggedIn
               // print(loggedIn)
                self?.isLoggedIn = true
                self?.isLoading = false
            },
            onFailure: { [weak self] error in
                self?.logViewModel.crash(screen: LoginView.viewName,
                                   exception: error)
                self?.isLoading = false
            }
        )
    }
    
//    func registerUser() {
//        authViewModel.register(email: email,
//                               password: password,
//                               onSuccess: { [weak self] user in
//            self?.logViewModel.log(screen: LoginView.viewName,
//                             action: "USER_REGISTERED")
//        },
//                               onFailure: { [weak self] error in
//            print(error.localizedDescription)
//            self?.alertMessage = error.localizedDescription
//            self?.showAlert = true
//        })
//    }
}
