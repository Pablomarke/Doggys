//
//  MapMarkerIcon.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 18/4/24.
//

import SwiftUI

struct MapMarkerIcon: View {
    var name: String
    
    var body: some View {
            Image(.logoIcon)
                .resizable()
                .frame(width: 60,
                       height: 60,
                       alignment: .center)
                .clipShape(.circle)
        Text(name)
    }
}

#Preview {
    MapMarkerIcon(name: "José")
}
