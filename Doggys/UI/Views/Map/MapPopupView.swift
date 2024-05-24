//
//  MapPopupView.swift
//  Doggys
//
//  Created by Marco Muñoz on 23/5/24.
//

import SwiftUI

struct MapPopupView: View {
    var nameProfile: String
    var gender: String = "Macho"
    var years: String = "00"
    var friendly: String = "Si"
    var longWalk: String = "+30 min"
    @State var isFav: Bool = false
    
    var body: some View {
        VStack{
            Image(.logoEars)
                .resizable()
                .frame(width: 100, height: 60)
                .padding(.bottom, -10)
            Text(nameProfile)
                .font(.title3)
                .bold()
            Text("Género: \(gender)")
            Text("Edad: \(years)")
            Text("Amigable: \(friendly)")
            Text("Paseo: \(longWalk)")
            Button("", systemImage: isFav ? "star.fill" : "star") {
                isFav.toggle()
            }
            .padding(.top, -1)
            .foregroundStyle(isFav ? .yellow : .gray)
        }
    }
}

#Preview {
    MapPopupView(nameProfile: "User")
        .frame(width: 300, height: 240)
}
