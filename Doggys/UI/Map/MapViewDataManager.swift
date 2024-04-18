//
//  MapViewDataManager.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 18/4/24.
//

import Foundation
import MapKit

final class MapViewDataManager {
    var mockUsersData: MarkerMapList =  [
        MarkerMap(name: "Rosco", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.411964, longitude: -3.705893)),
        MarkerMap(name: "Pancho", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.425164, longitude: -3.692847)),
        MarkerMap(name: "Pepito", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.430913, longitude:  -3.714991)),
        MarkerMap(name: "Luna", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.412748, longitude:  -3.685637)),
        MarkerMap(name: "Kala", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.415624, longitude:  -3.680831)),
        MarkerMap(name: "Kala", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.415624, longitude:  -3.680831)),
        MarkerMap(name: "Chispa", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.432481, longitude:   -3.689328)),
        MarkerMap(name: "Ron", 
                  coordinate: CLLocationCoordinate2D(latitude: 40.391366, longitude:    -3.683808))
    ]
}
