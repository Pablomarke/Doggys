//
//  SplashViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import Foundation

final class SplashViewModel: BaseViewModel {
    // MARK: - Properties -
    @Published var navigateToLogin: Bool = false
    @Published var navigateToHome: Bool = false
    private var authViewModel: AuthProtocol
    private var logViewModel: LogProtocol
    
    init(authViewModel: AuthProtocol, logViewModel: LogProtocol) {
        self.authViewModel = authViewModel
        self.logViewModel = logViewModel
    }
    
    // MARK: - Public methods -
    func initView() {
        userRememberLogin()
    }
}

private extension SplashViewModel {
    func userRememberLogin() {
        if UserDefaults.standard.bool(forKey: Preferences.rememberLogin) {
            self.checkIfUserIsLoggedIn()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                self?.navigateToLogin = true
            }
        }
    }
    
    func checkIfUserIsLoggedIn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.authViewModel.isUserLoggedIn()
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        self?.logViewModel.crash(screen: LoginView.viewName,
                                                 exception: error)
                    }
                }, receiveValue: { [weak self] loggedIn in
                    self?.navigateToHome = loggedIn
                    if !loggedIn {
                        self?.navigateToLogin = true
                    }
                }).store(in: &self!.cancellables)
        }
    }
}
