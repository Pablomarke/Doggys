//
//  LogoAppDetailView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct LogoAppDetailView: View {
    var body: some View {
        Image(.logoIcon)
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .cornerRadius(20)
            .shadow(color: .black, radius: 15, x: 0, y: 10)
    }
}

#Preview {
    LogoAppDetailView()
}
