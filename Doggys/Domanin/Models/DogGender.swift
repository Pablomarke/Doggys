//
//  DogGender.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum DogGender: String, CaseIterable, CustomStringConvertible {
    case female = "Hembra"
    case male = "Macho"
    
    var description: String {
        return rawValue
    }
}
