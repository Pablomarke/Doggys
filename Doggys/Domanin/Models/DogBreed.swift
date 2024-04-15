//
//  DogBreed.swift
//  Doggys
//
//  Created by Marco Muñoz on 11/4/24.
//

import Foundation

enum RazaPerro: String, CaseIterable, CustomStringConvertible {
    case mestizo = "Mestizo"
    case akita = "Akita"
    case bassetHound = "Basset Hound"
    case beagle = "Beagle"
    case bichonFrise = "Bichón Frisé"
    case borderCollie = "Border Collie"
    case boxer = "Boxer"
    case bulldog = "Bulldog"
    case chihuahua = "Chihuahua"
    case cockerSpaniel = "Cocker Spaniel"
    case dalmata = "Dálmata"
    case doberman = "Doberman"
    case dogoArgentino = "Dogo Argentino"
    case dogoDeBurdeos = "Dogo de Burdeos"
    case galgo = "Galgo"
    case goldenRetriever = "Golden Retriever"
    case huskySiberiano = "Husky Siberiano"
    case labradorRetriever = "Labrador Retriever"
    case maltés = "Maltés"
    case pastorAleman = "Pastor Alemán"
    case pomerania = "Pomerania"
    case poodle = "Poodle"
    case pug = "Pug"
    case rottweiler = "Rottweiler"
    case sanBernardo = "San Bernardo"
    case schnauzer = "Schnauzer"
    case shihTzu = "Shih Tzu"
    case staffordshireBullTerrier = "Staffordshire Bull Terrier"
    case westHighlandWhiteTerrier = "West Highland White Terrier"
    case otraRaza = "Otra Raza"
    
    var description: String {
        return rawValue
    }
}
