//
//  SplashWireFrame.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import SwiftUI

enum SplashWireFrame {
    static func createView() -> some View {
        let authViewModel: AuthProtocol = FirebaseAuthViewModel()
        let logViewModel: LogProtocol = FirebaseLogViewModel()
        let locationManager: GpsLocationManagerProtocol = GpsLocationManager()
        let viewModel: SplashViewModel = SplashViewModel(authViewModel: authViewModel,
                                                         logViewModel: logViewModel, 
                                                         locationManager: locationManager)
        let view = SplashView(viewModel: viewModel)
        return view
    }
}
