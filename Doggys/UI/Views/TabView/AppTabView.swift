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
            MapViewWireFrame().viewController
                .tabItem {
                    Label("Mapa", 
                          systemImage: "map")
                }
                .padding(.bottom, 90)
                .ignoresSafeArea()
            
            ProfileWireFrame().viewController
                .tabItem {
                    Label("Perfil", 
                          systemImage: "person.fill")
                }
                .padding(.bottom, 90)
                .ignoresSafeArea()
            
            SettingsWireframe().viewController
                .tabItem {
                    Label("Ajustes",
                          systemImage: "gear")
                }
                .padding(.bottom, 90)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AppTabView()
}