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
    @Published var selfRegion: MKCoordinateRegion = .init()
    private var selfSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,
                                        longitudeDelta: 0.01)
    var markers: MarkerMapList = .init()
    
    init(dataManager: MapViewDataManager, locationManager: GpsLocationManager) {
        self.dataManager = dataManager
        self.locationManager = locationManager
    }
    
    // MARK: - Public methods -
    func chargeData() {
        markers = dataManager.mockUsersData
        getLocationAndCenter()
    }
    
    func getLocationAndCenter() {
        let location = self.locationManager.getLocation()
        DispatchQueue.main.async {
            self.selfRegion.center = location
            self.selfRegion.span = self.selfSpan
        }
    }
}

private extension MapViewModel {
    //TODO: Implement this
    func getCurrentLocationAndCenter() {
        locationManager.getCurrentLocation { [weak self] coordinate, error in
            if let coordinate = coordinate {
                DispatchQueue.main.async {
                    self?.selfRegion.center = coordinate
                }
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
