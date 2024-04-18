//
//  ButtonLabel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 7/4/24.
//

import SwiftUI

struct ButtonLabel: View {
    var word: String
    
    var body: some View {
        Text(word)
            .font(.custom("Jost-Light",
                          size: 24))
            .foregroundStyle(.customWhite)
            .frame(width: 200,
                   height: 56)
            .background(.customLightBlue)
            .cornerRadius(20)
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(.customWhite,
                        lineWidth: 3))
           // .padding()
    }
}

#Preview {
    ButtonLabel(word: "enviar")
}
