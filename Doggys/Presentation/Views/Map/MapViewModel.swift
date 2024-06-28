//
//  MapViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import Foundation
import MapKit
import Combine

final class MapViewModel: BaseViewModel {
    // MARK: - Properties -
    private var locationManager: GpsLocationManagerProtocol
    private var userProfileViewModel: UserProfileProtocol
    @Published var selfRegion: MKCoordinateRegion = .init()
    @Published var selectedUser: UserProfile? = nil
    @Published var userProfiles: UsersProfileList = .init()

    private var selfSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,
                                                              longitudeDelta: 0.01)
    
    init(locationManager: GpsLocationManagerProtocol,
         userProfileViewModel: UserProfileProtocol) {
        self.locationManager = locationManager
        self.userProfileViewModel = userProfileViewModel
    }
    
    // MARK: - Public methods -
    func chargeData() {
        defaultRegion()
        getData()
    }
    
    func defaultRegion() {
        DispatchQueue.main.async {
            let location = self.locationManager.gpsLocation()
            let region = MKCoordinateRegion(center: location,
                                            span: self.selfSpan)
            self.selfRegion = region
        }
    }
    
    func getLocationAndCenter() {
        self.locationManager.getLocation()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] location in
                guard let self = self else {
                    return
                }
                
                let region = MKCoordinateRegion(center: location,
                                                span: self.selfSpan)
                selfRegion = region
            })
            .store(in: &cancellables)
    }
    
    func getData() {
        userProfileViewModel.fetchData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                //TODO: error
                print(completion)
            } receiveValue: { [weak self] data in
                self?.userProfiles.append(contentsOf: data)
            }
            .store(in: &cancellables)
    }
}

private extension MapViewModel {
    //TODO: Implement this
    func getCurrentLocationAndCenter() {
        locationManager.getCurrentLocation()
            .sink { [weak self] completion in
                //TODO: error
                print(completion)
            } receiveValue: { [weak self] location in
                self?.selfRegion.center = location
            }
            .store(in: &cancellables)
    }
}
