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
            "dogGender": dogGender.rawValue,
            "dogWalk": dogWalk.rawValue,
            "dogFriendly": dogFriendly.rawValue,
//            "coordenates": coordenates.coordinate
        ]
    }
}
