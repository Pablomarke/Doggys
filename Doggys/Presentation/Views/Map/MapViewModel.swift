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
    private var locationManager: GpsLocationManagerProtocol
    private var userProfileViewModel: UserProfileProtocol
    @Published var selfRegion: MKCoordinateRegion = .init()
    private var selfSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,
                                                              longitudeDelta: 0.01)
    var userProfiles: UsersProfileList = .init()
    var cancellable: Set<AnyCancellable> = .init()
    
    init(locationManager: GpsLocationManagerProtocol,
         userProfileViewModel: UserProfileProtocol) {
        self.locationManager = locationManager
        self.userProfileViewModel = userProfileViewModel
    }
    
    // MARK: - Public methods -
    func chargeData() {
        getLocationAndCenter()
        getData()
    }
    
    func getLocationAndCenter() {
        self.locationManager.getLocation()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { location in
                self.selfRegion.center = location
                self.selfRegion.span = self.selfSpan
            })
            .store(in: &cancellable)
    }
    
    func getData() {
        userProfileViewModel.fetchData()
            .sink { [weak self] completion in
                //TODO: error
                print(completion)
        } receiveValue: { [weak self] data in
            self?.userProfiles.append(contentsOf: data)
        }
        .store(in: &cancellable)
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
            }.store(in: &cancellable)
    }
}
