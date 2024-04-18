//
//  SettingsView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 11/4/24.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties -
    @ObservedObject var viewModel: SettingsViewModel
    static var viewName: String = "SettingsView"
    
    public init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - View -
    var body: some View {
        ZStack {
            Color.customMain
                .ignoresSafeArea()
            VStack {
                LogoHeader(text: "Ajustes")
                    .padding(.top, 
                             60)
                Button(action: {
                    viewModel.disconnect()
                }, label: {
                    ButtonLabel(word: "Desconectar")
                })
            }
            NavigationLink(destination: LoginWireFrame().viewController,
                           isActive: $viewModel.isLogOut) {
                EmptyView()
            }
        }
    }
    // MARK: - Public methods -
    mutating func set(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    AppTabView()
}
