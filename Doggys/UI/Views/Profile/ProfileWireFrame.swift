//
//  ProfileWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.


import SwiftUI

enum ProfileWireFrame {
    static func createView() -> some View {
        let userViewModel: UserProfileProtocol = FirebaseUserProfileViewModel()
        let logViewModel: LogProtocol = FirebaseLogViewModel()
        let storageViewModel: StorageProtocol = FirebaseStorageViewModel()
        let locationManager: GpsLocationManagerProtocol = GpsLocationManager()
        let viewModel: ProfileViewModel = ProfileViewModel(userViewModel: userViewModel,
                                                           logViewModel: logViewModel,
                                                           storageViewModel: storageViewModel,
                                                           locationManager: locationManager)
        var viewController = ProfileView(viewModel: viewModel)
        return AnyView(viewController)
    }
}
