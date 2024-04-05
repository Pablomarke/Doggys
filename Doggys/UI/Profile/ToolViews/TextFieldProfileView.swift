//
//  TextFieldProfileView.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI

struct TextFieldProfileView: View {
    @Binding var text: String
    
    var body: some View {
        TextField(text,
                  text: $text)
            .padding()
            .frame(width:320)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(20)
            .shadow(radius: 10, x: 5, y: 10)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .opacity(0.9)
    }
}
