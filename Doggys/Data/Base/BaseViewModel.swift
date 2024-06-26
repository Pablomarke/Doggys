//
//  BaseViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 18/4/24.
//

import Foundation
import FirebaseAnalytics
import Combine

class BaseViewModel: ObservableObject {
    var cancellables: Set<AnyCancellable> = .init()
    @Published var gpsAlert: Bool = false
    
    func emailIsValid(email: String) -> Bool {
        return email.contains("@")
    }
    
    func passwordIsValid(password: String) -> Bool {
        return password.count >= 6
    }
    
    func loginIsValid(email: String, password: String) -> Bool {
        return emailIsValid(email: email) && passwordIsValid(password: password)
    }
    
    func initAnalyticsFirebase(text: String, message: String) {
        Analytics.logEvent(text,
                           parameters: ["message":message])
    }
    
    func emailVerify(email: String) -> Bool {
        return !email.isEmpty && emailIsValid(email: email)
    }
    
    func openSettings() {
        if let url = URL(string: "App-Prefs:root=LOCATION_SERVICES"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url,
                                      options: [:],
                                      completionHandler: nil)
        } else if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
}
