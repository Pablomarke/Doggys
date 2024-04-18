//
//  DogFriendly.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum PerroAmigable: String, CaseIterable, CustomStringConvertible {
    case si = "Sí"
    case no = "No"
    case siMale = "Sí, sólo con Machos"
    case siFemale = "Sí, sólo con Hembras"
    
    var description: String {
        return rawValue
    }
}
