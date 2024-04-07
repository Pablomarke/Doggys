//
//  LogoView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 1/4/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack {
            Image(decorative: "logoEars")
                .resizable()
                .frame(width: 400,
                       height: 250)
            Image(decorative: "text")
                .resizable()
                .frame(width: 160,
                       height: 50,
                       alignment: .center)
                .padding(.top, -60)
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    LogoView()
}
