//
//  MapWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI

enum MapViewWireFrame {
    static func createView() -> some View {
        let authViewModel: AuthProtocol = FirebaseAuthViewModel()
        let logViewModel: LogProtocol = FirebaseLogViewModel()
        let locationManager: GpsLocationManager = GpsLocationManager()
        let userProfileViewModel: UserProfileProtocol = FirebaseUserProfileViewModel()
        let viewModel: MapViewModel = MapViewModel(locationManager: locationManager,
                                                   userProfileViewModel: userProfileViewModel)
        let view: MapView = MapView(viewModel: viewModel)
        return view
    }
}
