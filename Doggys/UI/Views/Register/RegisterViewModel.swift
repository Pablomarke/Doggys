//
//  RegisterViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import Foundation
import Combine

final class RegisterViewModel: BaseViewModel{
    //MARK: - Properties
    private var logViewModel: LogProtocol
    private var authViewModel: AuthProtocol
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var navigateToProfile: Bool = false
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(logViewModel: LogProtocol, authViewModel: AuthProtocol) {
        self.logViewModel = logViewModel
        self.authViewModel = authViewModel
    }
    
    // MARK: - Public methods
    func registerUser() {
        authViewModel.register(email: email,
                                      password: password)
        .sink { [weak self] error in
            self?.alertMessage = "Error"
            self?.showAlert = true
        } receiveValue: { [weak self] user in
            self?.logViewModel.log(screen: RegisterView.viewName,
                             action: "USER_REGISTERED")
        }.store(in: &cancellables)
    }
    
    func registerValid() -> Bool {
        return emailVerify(email: email) && passwordVerify()
    }
    
    func passwordVerify() -> Bool {
        return !password.isEmpty && passwordMatch() && passwordIsValid(password: password)
    }
    
    func passwordMatch() -> Bool {
        return password == repeatPassword
    }
}
