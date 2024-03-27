//
//  TextFieldView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 26/3/24.
//

import SwiftUI

struct TextFieldView: View {
    @State var label = String()

    var body: some View {
        TextField(label, 
                  text: $label)
            .padding()
            .frame(width:280)
            .foregroundColor(.white)
            .background(Color.customLightBlue)
            .cornerRadius(20)
            .shadow(radius: 10, x: 5, y: 10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .opacity(0.9)
    }
}

#Preview {
    TextFieldView(label: "Email")
}
