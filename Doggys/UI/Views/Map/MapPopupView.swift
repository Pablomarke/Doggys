//
//  MapPopupView.swift
//  Doggys
//
//  Created by Marco Muñoz on 23/5/24.
//

import SwiftUI

struct MapPopupView: View {
    var nameProfile: String
    var gender: String
    var years: String
    var friendly: String
    var longWalk: String
    @State var isFav: Bool = false
    
    var body: some View {
        VStack{
            Image(.logoEars)
                .resizable()
                .frame(width: 100, height: 60)
                .padding(.bottom, -1)
            Text(nameProfile)
                .padding(.bottom, -1)
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
        .frame(width: 200, height: 250)
    }
}

#Preview {
    MapPopupView(nameProfile: "Romeo", gender: "Macho", years: "4", friendly: "Si", longWalk: "+1h, paseo largo")
        .frame(width: 200, height: 250)
        .background(.red)
}
