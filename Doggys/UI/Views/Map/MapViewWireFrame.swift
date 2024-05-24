//
//  MapWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI

final class MapViewWireFrame {
    //MARK: Public Methods
    var viewController: AnyView {
        let locationManager: GpsLocationManager = createGpsLocationManager()
        let userProfileViewModel: UserProfileProtocol = createUserProfileViewModel()
        
        let viewModel: MapViewModel = MapViewModel(locationManager: locationManager,
                                                   userProfileViewModel: userProfileViewModel)
        var viewController = MapView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: - Private Methods -
    private func createViewModel(locationManager: GpsLocationManager,
                                 userProfileViewModel: UserProfileProtocol) -> MapViewModel {
        MapViewModel(locationManager: locationManager,
                     userProfileViewModel: userProfileViewModel)
    }
    
    private func createGpsLocationManager() -> GpsLocationManager {
        GpsLocationManager()
    }
    
    private func createUserProfileViewModel() -> UserProfileProtocol {
        return FirebaseUserProfileViewModel()
    }
}
