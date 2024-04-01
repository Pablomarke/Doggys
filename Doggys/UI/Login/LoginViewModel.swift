//
//  LoginViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import Foundation
import FirebaseAnalytics

final class LoginViewModel: ObservableObject {
    private var dataManager: LoginDataManager
    
    init(dataManager: LoginDataManager) {
        self.dataManager = dataManager
    }
    
    func initAnalyticsFirebase() {
        Analytics.logEvent("Entro a la app",
                           parameters: ["message":"Arranca la app"])
    }
}
