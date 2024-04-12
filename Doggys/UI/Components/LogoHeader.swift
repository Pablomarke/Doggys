//
//  LogoHeader.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 7/4/24.
//

import SwiftUI

struct LogoHeader: View {
    var text: String
    var toTop: CGFloat = -160
    
    var body: some View {
        Image(.logoEars)
            .resizable()
            .frame(width: 400,
                   height: 250,
                   alignment: .center)
            .padding(.top,
                     toTop)
        Text(text)
            .font(.system(size: 40,
                          weight: .light,
                          design: .monospaced))
            .padding(.top, -70)
    }
}

#Preview {
    LogoHeader(text: "Registrar")
}
