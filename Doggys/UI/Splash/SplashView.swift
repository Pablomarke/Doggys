//
//  SplashView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.customGreenblue
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                LogoView().background(Color.customGreenblue)
                Spacer()
                ProgressView()                    .scaleEffect(3.0)
                Spacer()
            }
        }
    }
}

#Preview {
    SplashView()
}
