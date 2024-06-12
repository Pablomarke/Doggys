//
//  RegisterWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 3/4/24.
//

import SwiftUI

enum RegisterWireFrame {
    static func createView() -> some View {
        let authViewModel: AuthProtocol = FirebaseAuthViewModel()
        let logViewModel: LogProtocol = FirebaseLogViewModel()
        let viewModel: RegisterViewModel = RegisterViewModel(logViewModel: logViewModel,
                                                             authViewModel: authViewModel)
        let view = RegisterView(viewModel: viewModel)
        
        return view
    }
}
