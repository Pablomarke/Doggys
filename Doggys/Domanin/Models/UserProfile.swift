//
//  UserProfile.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import Foundation

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
    let selfLatitude : Double
    let selfLongitude: Double
    
    init(id: String, 
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
        
        self.id = id
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
