//
//  TextFieldView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 26/3/24.
//
import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    var placeholder: String?
    var colorBackgroud: Color = .customWhite40
    
    var body: some View {
        ZStack(alignment: .leading) {
            if let placeholder = placeholder {
                Text(placeholder)
                    .font(.custom("Jost-Light", size: 22))
                // TODO: Establecer el color de los placehodler
                    .foregroundStyle(.customBlue)
                    .padding(.leading, 16)
                    .opacity(text.isEmpty ? 1 : 0)
            }
            
            TextField("", text: $text)
                .font(.custom("Jost-Light", size: 22))
                .padding()
                .frame(width:280, height: 60)
                .foregroundColor(.customBlue)
                .background(colorBackgroud)
                .cornerRadius(20)
                .background(RoundedRectangle(cornerRadius: 20).stroke(.customWhite, lineWidth: 4))
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
    }
}
