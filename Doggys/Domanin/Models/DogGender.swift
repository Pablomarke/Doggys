//
//  DogGender.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum DogGender: String, CaseIterable, CustomStringConvertible, Decodable {
    case none = "Seleccione género"
    case female = "Hembra"
    case male = "Macho"
    
    var description: String {
        return rawValue
    }
}
