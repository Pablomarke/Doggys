//
//  RecoveryWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 4/4/24.
//

import SwiftUI

enum RecoveryWireFrame {
    static func createView() -> some View {
        let authViewModel: AuthProtocol = FirebaseAuthViewModel()
        let logViewModel: LogProtocol = FirebaseLogViewModel()
        let viewModel: RecoveryViewModel = RecoveryViewModel(logViewModel: logViewModel, 
                                                                             authViewModel: authViewModel)
        let view = RecoveryView(viewModel: viewModel)
        return view
    }
}
