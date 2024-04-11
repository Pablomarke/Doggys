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
            MapView()
                .tabItem {
                    Label("Mapa", 
                          systemImage: "map")
                }
                .padding(.bottom, 90)
                .ignoresSafeArea()
            
            ProfileView()
                .tabItem {
                    Label("Perfil", 
                          systemImage: "person.fill")
                }
                .padding(.bottom, 70)
                .ignoresSafeArea()
            
            SettingsWireframe().viewController
                .tabItem {
                    Label("Ajustes",
                          systemImage: "gear")
                }
                .padding(.bottom, 70)
                .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AppTabView()
}
