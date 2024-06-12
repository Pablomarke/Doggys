//
//  BackArrow.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 18/4/24.
//

import SwiftUI

struct BackArrow: View {
    @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Atrás")
                }
            }
        }
}

#Preview {
    BackArrow()
}
