//
//  UserProfile+Firebase.swift
//  Doggys
//
//  Created by Marco Muñoz on 12/4/24.
//

import FirebaseFirestore

extension UserProfile {
    var dictionary: [String: Any] {
        return [
            "imageProfile": imageProfile,
            "humanName": humanName,
            "dogName": dogName,
            "dogYears": dogYears,
            "dogBreed": dogBreed.rawValue,
            "dogGender": dogGender.rawValue,
            "dogWalk": dogWalk.rawValue,
            "dogFriendly": dogFriendly.rawValue,
            "selfLatitude" : selfLatitude,
            "selfLongitude": selfLongitude
        ]
    }
}
