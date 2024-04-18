//
//  RegisterViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    
    //MARK: - Properties
    private var logViewModel: LogProtocol
    private var authViewModel: AuthProtocol
    @Published var email = ""
    @Published var password = ""
    @Published var repeatPassword = ""
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    init(logViewModel: LogProtocol, authViewModel: AuthProtocol) {
        self.logViewModel = logViewModel
        self.authViewModel = authViewModel
    }
    
    // MARK: - Public methods
    func registerUser() {
        authViewModel.register(email: email,
                               password: password,
                               onSuccess: { [weak self] user in
            self?.logViewModel.log(screen: RegisterView.viewName,
                             action: "USER_REGISTERED")
        },
                               onFailure: { [weak self] error in
            self?.alertMessage = error.localizedDescription
            self?.showAlert = true
        })
    }
    
    func registerValid() -> Bool {
        return emailVerify() && passwordVerify()
    }
    
    func passwordVerify() -> Bool {
        return passwordNotEmpty() && passwordMatch() && passwordLength()
    }
    
    func passwordNotEmpty() -> Bool {
        return !password.isEmpty
    }
    
    func passwordMatch() -> Bool {
        return password == repeatPassword
    }
    
    func passwordLength() -> Bool {
        return password.count >= 6
    }
    
    func emailVerify() -> Bool {
        return !email.isEmpty && emailValid()
    }
    
    func emailValid() -> Bool {
        return email.contains("@")
    }
    
}
