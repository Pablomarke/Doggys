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
            .font(.title3)
            .foregroundStyle(.white)
            .frame(width: 150,
                   height: 40)
            .background(.customLightGreen)
            .cornerRadius(15)
            .shadow(radius: 15,
                    x: 0,
                    y: 10)
            .padding()    }
}

#Preview {
    ButtonLabel(word: "enviar")
}
