//
//  UserProfile.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import Foundation
import MapKit

class UserProfile: Identifiable {
    let id: String
    let humanName: String
    let dogName: String
    let dogYears: String
    let dogGender: GeneroPerro
    let dogWalk: PaseoPerro
    let dogFriendly: PerroAmigable
    let coordenates : MarkerMap
    
    init() {
        self.id = ""
        self.humanName = ""
        self.dogName = ""
        self.dogYears = ""
        self.dogGender = .macho
        self.dogWalk = .corto
        self.dogFriendly = .si
        self.coordenates = MarkerMap(name: String(), coordinate: CLLocationCoordinate2D())
    }
    
    init(id: String, humanName: String, dogName: String, dogYears: String, dogGender: GeneroPerro, dogWalk: PaseoPerro, dogFriendly: PerroAmigable, coordenates: MarkerMap) {
        self.id = id
        self.humanName = humanName
        self.dogName = dogName
        self.dogYears = dogYears
        self.dogGender = dogGender
        self.dogWalk = dogWalk
        self.dogFriendly = dogFriendly
        self.coordenates = coordenates
    }
}
