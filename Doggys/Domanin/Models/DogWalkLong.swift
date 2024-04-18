//
//  DogWalkLong.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum DogWalkLong: String, CaseIterable, CustomStringConvertible {
    case short = "Paseo corto / 20min Aprox."
    case medium = "Paseo Medio / 40min Aprox."
    case long = "Paseo Largo / 60min Aprox."
    case veryLong = "Paseo sin tiempo / + 1h."
    
    var description: String {
        return rawValue
    }
}
