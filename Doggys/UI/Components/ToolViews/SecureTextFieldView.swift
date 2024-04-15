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
            .font(.custom("Jost-Light",
                          size: 20))
            .padding()
            .frame(width: 280,
                   height: 60)
            .foregroundColor(.customBlue)
            .background(.customWhite40)
            .cornerRadius(20)
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(.customWhite,
                        lineWidth: 3))
            .padding()
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: isSecured ? "eye.slash" : "eye")
                    .accentColor(.customBlue)
                    .padding(.trailing, 24)
            }
        }
    }
}
