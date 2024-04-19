//
//  UserProfile.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import Foundation
import MapKit
import SwiftUI

class UserProfile: Identifiable {
    let id: String
    let imageProfile: String
    let humanName: String
    let dogName: String
    let dogYears: String
    let dogBreed: DogBreed
    let dogGender: DogGender
    let dogWalk: DogWalkLong
    let dogFriendly: DogFriendly
//    let coordenates : MarkerMap
    
    init() {
        self.id = ""
        self.imageProfile = ""
        self.humanName = ""
        self.dogName = ""
        self.dogYears = ""
        self.dogBreed = .beagle
        self.dogGender = .male
        self.dogWalk = .short
        self.dogFriendly = .yes
//        self.coordenates = MarkerMap(name: String(), coordinate: CLLocationCoordinate2D())
    }
    
    init(id: String, imageProfile: String, humanName: String, dogName: String, dogYears: String, dogBreed: DogBreed, dogGender: DogGender, dogWalk: DogWalkLong, dogFriendly: DogFriendly) {
        self.id = id
        self.imageProfile = imageProfile
        self.humanName = humanName
        self.dogName = dogName
        self.dogYears = dogYears
        self.dogBreed = dogBreed
        self.dogGender = dogGender
        self.dogWalk = dogWalk
        self.dogFriendly = dogFriendly
//        self.coordenates = coordenates
    }
}
