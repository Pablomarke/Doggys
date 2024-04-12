//
//  LogoView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 1/4/24.
//

import SwiftUI

struct LogoView: View {
    @State private var textOpacity = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            Image(.logoWhite)
                .resizable()
                .frame(width: 306,
                       height: 222)
            Text("Doggys")
                .font(.custom("Jost-Light",
                              size: 90))
                .foregroundStyle(Color.customWhite)
            /* .opacity(textOpacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        textOpacity = 1.0
                    }
                }*/
            Spacer()
        }
    }
}
    #Preview {
        LogoView().background(Color.customMain)
    }
