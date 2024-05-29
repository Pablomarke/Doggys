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
    var userHasLocation: Bool = false
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.checkUserAuthorization()
    }
    
    func getLocation() -> CLLocationCoordinate2D {
        if let location = locationManager.location?.coordinate {
            return location
        }
        return CLLocationCoordinate2D()
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
    
    func checkUserAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
            case .authorized, .authorizedAlways, .authorizedWhenInUse:
                userHasLocation = true
                break
            case .denied, .notDetermined, .restricted:
                print("User no ha autorizado mostrar su localización")
                userHasLocation = false
            @unknown default:
                print("Unhandled state")
        }
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
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkUserAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        errorHandler?(error)
    }
}
