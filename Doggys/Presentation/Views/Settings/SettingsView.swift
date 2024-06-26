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
    @State private var showMailView = false
    static var viewName: String = "SettingsView"
    
    public init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - View -
    var body: some View {
        appMainBackground {
            VStack {
                LogoHeader(text: "Ajustes")
                    .id(0)
                    .padding(.bottom, 100)
                Button(action: {
                    viewModel.disconnect()
                }, label: {
                    ButtonLabel(word: "Desconectar", colorForeground: .customWhite)
                })
                .id(1)
                .padding(.bottom, 50)
                Button(action: {
                    if self.viewModel.isMailAvailable{
                        self.showMailView.toggle()
                    } else {
                        print("Not registered mail, not available in simulator")
                    }
                }, label: {
                    ButtonLabel(word: "Contacto", colorForeground: .customWhite)
                })
                .sheet(isPresented: $showMailView) {
                    MailView(isShowing: self.$showMailView)
                }
            }
            NavigationLink(destination: LoginWireFrame.createView(),
                           isActive: $viewModel.isLogOut) {
                EmptyView()
            }
        }
        .onAppear{
            self.viewModel.checkMailAvailability()
        }
    }
}

#Preview {
    SettingsWireframe.createView()
}
