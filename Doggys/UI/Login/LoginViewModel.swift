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
    
    init(dataManager: LoginDataManager) {
        self.dataManager = dataManager
    }
    
    //MARK: Publics Methods
    func initAnalyticsFirebase() {
        Analytics.logEvent("Entro a la app",
                           parameters: ["message":"Arranca la app"])
    }
}
