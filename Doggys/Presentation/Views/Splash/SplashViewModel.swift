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
    private var locationManager: GpsLocationManagerProtocol
    
    init(authViewModel: AuthProtocol,
         logViewModel: LogProtocol,
         locationManager: GpsLocationManagerProtocol) {
        self.authViewModel = authViewModel
        self.logViewModel = logViewModel
        self.locationManager = locationManager
    }
    
    // MARK: - Public methods -
    func initView() {
        userRememberLogin()
        checkGPS()
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
                })
                .store(in: &self!.cancellables)
        }
    }
    
    func checkGPS() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else {
                return
            }
            
            if !self.locationManager.userHasLocation {
                self.gpsAlert = true
            }
        }
    }
}
