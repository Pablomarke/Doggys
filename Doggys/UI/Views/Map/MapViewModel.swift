//
//  MapViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import Foundation
import MapKit
import Combine

final class MapViewModel: ObservableObject {
    // MARK: - Properties -
    private var locationManager: GpsLocationManager
    private var dataManager: MapViewDataManager
    @Published var region: MKCoordinateRegion = .init()
    
    var markers: MarkerMapList = .init()
    
    init(dataManager: MapViewDataManager, locationManager: GpsLocationManager) {
        self.dataManager = dataManager
        self.locationManager = locationManager
    }
    
    // MARK: - Public methods -
    func chargeData() {
        self.region.span = MKCoordinateSpan(latitudeDelta: 0.01,
                                            longitudeDelta: 0.01)
        markers = dataManager.mockUsersData
        getLocationAndCenter()
    }
}

private extension MapViewModel {
    func getLocationAndCenter() {
        let location = self.locationManager.getLocation()
        DispatchQueue.main.async {
            self.region.center = location
        }
    }
    
    //TODO: Implement this
    func getCurrentLocationAndCenter() {
        locationManager.getCurrentLocation { [weak self] coordinate, error in
            if let coordinate = coordinate {
                DispatchQueue.main.async {
                    self?.region.center = coordinate
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
