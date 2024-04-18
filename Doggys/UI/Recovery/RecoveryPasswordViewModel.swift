//
//  RecoveryPasswordViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import Foundation

final class RecoveryPasswordViewModel: ObservableObject {
    
    //MARK: Properties
    private var logViewModel: LogProtocol
    private var authViewModel: AuthProtocol
    @Published var email = ""
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    init(logViewModel: LogProtocol, authViewModel: AuthProtocol) {
        self.logViewModel = logViewModel
        self.authViewModel = authViewModel
    }
    
    //MARK: - Public methods
    func recoveryPassword(){
        authViewModel.recoverPassword(email: email) {
            self.logViewModel.log(screen: RecoveryPasswordView.viewName, 
                                  action: "PASSWORD_RECOVERED")
            self.alertMessage = "Password recovery initiated"
        } onFailure: { [weak self] error in
            self?.alertMessage = error.localizedDescription
            self?.showAlert = true
        }
    }
}
