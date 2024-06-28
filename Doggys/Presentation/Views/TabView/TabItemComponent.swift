//
//  TabItemComponent.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 29/5/24.
//

import SwiftUI

struct TabItemComponent<Content: View>: View  {
    var view: Content
    var name: String
    var systemImage: SystemImageName
    
    enum SystemImageName: String {
        case map = "map"
        case person = "person.fill"
        case settings = "gear"
        case friends = "person.2"
    }
    
    var body: some View {
        view
            .tabItem {
                Label(name,
                      systemImage: systemImage.rawValue)
            }
            .padding(.bottom, 90)
            .ignoresSafeArea()
    }
}

#Preview {
    TabItemComponent(view: MapViewWireFrame.createView(),
                     name: "Map",
                     systemImage: .map)
}
