//
//  MapViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import Foundation
import MapKit
import Combine

class MapViewModel: ObservableObject {
    // MARK: - Properties -
    private var locationManager: GpsLocationManager = GpsLocationManager()
    private var locationName: String = ""
    var dataManager: MapViewDataManager
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.414315106259174,
                                                                              longitude: -3.689848595545417),
                                               span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @Published var markers: MarkerMapList = []
    
    init(dataManager: MapViewDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Public methods -
    func chargeData() {
        markers = dataManager.mockUsersData
        self.gpsSelfLocation {
            
        }
    }
    
    func gpsSelfLocation(completion: @escaping () -> ()) {
        locationManager.getCurrentLocation { coordinate, error in
            if let coordinate = coordinate {
                self.region.center = coordinate
                self.locationName = "coordinates: \n \n - Latitude: \(coordinate.latitude)\n - Longitude: \(coordinate.longitude)"
                completion()
            } else if let error = error {
                self.locationName = "Error"
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
