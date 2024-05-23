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
        let dataManager: MapViewDataManager = createDataManager()
        let locationManager: GpsLocationManager = createGpsLocationManager()
        let viewModel: MapViewModel = MapViewModel(dataManager: dataManager, locationManager: locationManager)
        var viewController = MapView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel(dataManager: MapViewDataManager,
                                 locationManager: GpsLocationManager) -> MapViewModel {
        MapViewModel(dataManager: dataManager,
                     locationManager: locationManager)
    }
    
    private func createDataManager() -> MapViewDataManager {
        MapViewDataManager()
    }
    
    private func createGpsLocationManager() -> GpsLocationManager {
        GpsLocationManager()
    }
}
