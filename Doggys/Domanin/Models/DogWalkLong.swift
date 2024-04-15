//
//  DogWalkLong.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum PaseoPerro: String, CaseIterable, CustomStringConvertible {
    case corto = "Paseo corto / 20min Aprox."
    case medio = "Paseo Medio / 40min Aprox."
    case largo = "Paseo Largo / 60min Aprox."
    case muyLargo = "Paseo sin tiempo / + 1h."
    
    var description: String {
        return rawValue
    }
}
