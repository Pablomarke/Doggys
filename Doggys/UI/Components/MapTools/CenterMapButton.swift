//
//  CenterMapButton.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 23/5/24.
//

import SwiftUI

struct CenterMapButton: View {
    var action: () -> Void
    
    var body: some View {
        ZStack(content: {
            Circle()
                .foregroundColor(.customWhite)
                .frame(width: 44, height: 44)

            Button(action: {
                action()
            }) {
                Image(systemName: "location.north.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(.customMain)
                    .padding()
            }
            .buttonStyle(PlainButtonStyle())
        })
    }
}

#Preview {
    CenterMapButton(action: {
        print("ok")
    })
}
