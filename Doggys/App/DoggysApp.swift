//
//  DoggysApp.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 21/3/24.
//

import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct DoggysApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let authViewModel: AuthProtocol
    let logViewModel: LogProtocol
    
    init() {
        self.authViewModel = FirebaseAuthViewModel()
        self.logViewModel = FirebaseLogViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginWireFrame(authViewModel: authViewModel, logViewModel: logViewModel).viewController
        }
    }
}

