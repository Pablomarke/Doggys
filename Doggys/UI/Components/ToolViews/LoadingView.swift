//
//  LoadingView.swift
//  Doggys
//
//  Created by Daniel Cazorro Frías on 9/4/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Color.customWhite.opacity(0.5)
            .ignoresSafeArea()
            .overlay(
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            )
    }
}

#Preview {
    LoadingView()
}
