//
//  LoginWireFrame.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 31/3/24.
//

import SwiftUI

enum LoginWireFrame {
    static func createView() -> some View {
        let authViewModel: AuthProtocol = FirebaseAuthViewModel()
        let logViewModel: LogProtocol = FirebaseLogViewModel()
        let keyChain: KeyChainDataProvider = KeyChainDataProvider()
        let viewModel: LoginViewModel = LoginViewModel(authViewModel: authViewModel,
                                                       logViewModel: logViewModel,
                                                       keyChain: keyChain)
        let view = LoginView(viewModel: viewModel)
        
        return view
    }
}
