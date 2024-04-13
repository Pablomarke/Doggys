//
//  SecureTextFieldView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 26/3/24.
//

import SwiftUI

struct SecureTextFieldView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .padding(.trailing, 24)
                } else {
                    TextField(title, text: $text)
                        .padding(.trailing, 24)

                }
            }
            .padding()
            .frame(width: 280)
            .foregroundColor(.white)
            // TODO: Change colour for custom in future
            .background(Color.customLightBlue)
            .cornerRadius(20)
            .shadow(radius: 10, x: 5, y: 10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .opacity(0.9)
            .padding()
            
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(Color.customGreen)
                    .padding(.trailing, 24)
            }
        }
    }
}
