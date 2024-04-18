//
//  LogoHeader.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 7/4/24.
//

import SwiftUI

struct LogoHeader: View {
    var text: String
    var toTop: CGFloat = -60
    
    var body: some View {
        VStack {
            Image(.logoWhite)
                .resizable()
                .frame(width: 306,
                       height: 222)
                .padding(.bottom, 40)
            Text(text)
                .font(.custom("Jost-Light",
                              size: 60))
                .foregroundStyle(.customWhite)
                .padding(.top, -70)
        }
    }
}

#Preview {
    LogoHeader(text: "Registrar").background(Color.customMain)
}
