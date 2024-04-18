//
//  ViewExtension.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 13/4/24.
//

import SwiftUI

extension View {
    func fadeInAnimation() -> some View {
        self.modifier(FadeInModifier())
    }
}
