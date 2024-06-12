//
//  DogFriendly.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum DogFriendly: String, CaseIterable, CustomStringConvertible, Decodable {
    case none = "¿Sociable?"
    case yes = "Sí"
    case no = "No"
    case yesMale = "Sí, sólo con Machos"
    case yesFemale = "Sí, sólo con Hembras"
    
    var description: String {
        return rawValue
    }
}
