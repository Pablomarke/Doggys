//
//  DogGender.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum GeneroPerro: String, CaseIterable, CustomStringConvertible {
    case hembra = "Hembra"
    case macho = "Macho"
    
    var description: String {
        return rawValue
    }
}
