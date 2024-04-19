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
    var dataManager: MapViewDataManager
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.414315106259174,
                                                                                  longitude: -3.689848595545417),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                          longitudeDelta: 0.1))
    @Published var markers: MarkerMapList = []

    init(dataManager: MapViewDataManager) {
        self.dataManager = dataManager
    }
    
    // MARK: - Public methods -
    func chargeData() {
        markers = dataManager.mockUsersData
    }
}
