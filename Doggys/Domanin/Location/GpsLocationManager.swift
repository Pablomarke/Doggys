//
//  GpsLocationManager.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 21/5/24.
//

import CoreLocation

class GpsLocationManager: NSObject {
    private var locationManager: CLLocationManager
    var locationUpdateHandler: ((CLLocationCoordinate2D) -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func getCurrentLocation(completion: @escaping (CLLocationCoordinate2D?,
                                                   Error?) -> Void) {
        self.locationUpdateHandler = { coordinate in
            completion(coordinate, nil)
        }
        
        self.errorHandler = { error in
            completion(nil, error)
        }
        
        self.locationManager.startUpdatingLocation()
    }
}

extension GpsLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        let coordinate = location.coordinate
        locationUpdateHandler?(coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        errorHandler?(error)
    }
}
