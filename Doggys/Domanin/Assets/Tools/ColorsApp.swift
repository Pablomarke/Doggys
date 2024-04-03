//
//  Constants.swift
//  Doggys
//
//  Created by Marco Muñoz on 25/3/24.
//

import SwiftUI

//Colores App

extension Color {
    static func hex(_ hex: String) -> Color {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        guard scanner.scanHexInt64(&rgbValue) else {
            return Color.clear
        }
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        return Color(red: red, green: green, blue: blue)
    }
    /*
     static let customBlue = Color.hex("1647CC")
     static let customLightBlue = Color.hex("65A8D6")
     static let customGreenBlue = Color.hex("4CB5BF")
     static let customGreen = Color.hex("4DBB9F")
     static let customLightGreen = Color.hex("61CC8C")
     
     }*/
}
