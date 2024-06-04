//
//  RecoveryPasswordViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import Foundation

final class RecoveryViewModel: BaseViewModel {
    //MARK: Properties
    private var logViewModel: LogProtocol
    private var authViewModel: AuthProtocol
    @Published var email: String = ""
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    init(logViewModel: LogProtocol, authViewModel: AuthProtocol) {
        self.logViewModel = logViewModel
        self.authViewModel = authViewModel
    }
    
    //MARK: - Public methods
    func recoveryPassword() {
        authViewModel.recoverPassword(email: email)
            .sink { [weak self] error in
                self?.alertMessage = "Error"
                self?.showAlert = true
            } receiveValue: { _ in
                self.logViewModel.log(screen: RecoveryView.viewName,
                                      action: "PASSWORD_RECOVERED")
                self.alertMessage = "Password recovery initiated"
            }.store(in: &cancellables)
    }
}
