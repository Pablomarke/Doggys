//
//  UserProfile.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import Foundation
import MapKit

typealias UsersProfileList = [UserProfile]

class UserProfile: Identifiable, Decodable {
   // let id: String
    let imageProfile: String
    let humanName: String
    let dogName: String
    let dogYears: String
    let dogBreed: DogBreed
    let dogGender: DogGender
    let dogWalk: DogWalkLong
    let dogFriendly: DogFriendly
    let selfLatitude : Double
    let selfLongitude: Double
    var coordinate: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: selfLatitude, longitude: selfLongitude)}
    
    init(
         imageProfile: String,
         humanName: String,
         dogName: String, 
         dogYears: String,
         dogBreed: DogBreed,
         dogGender: DogGender,
         dogWalk: DogWalkLong,
         dogFriendly: DogFriendly,
         selfLatitude : Double,
         selfLongitude: Double) {
        
        //self.id = id
        self.imageProfile = imageProfile
        self.humanName = humanName
        self.dogName = dogName
        self.dogYears = dogYears
        self.dogBreed = dogBreed
        self.dogGender = dogGender
        self.dogWalk = dogWalk
        self.dogFriendly = dogFriendly
        self.selfLatitude = selfLatitude
        self.selfLongitude = selfLongitude
    }
}
