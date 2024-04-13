//
//  TextFieldView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 26/3/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    var colorBackgroud: Color = .customWhite40
    
    var body: some View {
        TextField(text,
                  text: $text)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(.customWhite,
                        lineWidth: 4))

            .frame(width:280,
                   height: 56)
            .foregroundColor(.customBlue)
            .background(colorBackgroud)
            .cornerRadius(20)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}
