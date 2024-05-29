//
//  AppTabView.swift
//  Doggys
//
//  Created by Marco Muñoz on 10/4/24.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            TabItemComponent(view: MapViewWireFrame.createView()
                             ,name: "Map",
                             systemImage: .map)
            
            TabItemComponent(view: ProfileWireFrame.createView(),
                             name: "Perfil",
                             systemImage: .person)
            
            TabItemComponent(view: SettingsWireframe.createView(),
                             name: "Ajustes",
                             systemImage: .settings)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AppTabView()
}
