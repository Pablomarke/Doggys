//
//  CustomMapIcon.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/5/24.
//

import SwiftUI

struct CustomMapIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}

#Preview {
    CustomMapIcon()
        .frame(width: 300, height: 240)
        .foregroundStyle(.customMain)
}
