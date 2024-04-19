//
//  RecoveryPasswordView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RecoveryPasswordView: View {
    //MARK: Properties
    @ObservedObject var viewModel: RecoveryPasswordViewModel
    @Environment(\.presentationMode) var presentationMode
    static var viewName: String = "RecoveryPasswordView"
    
    //MARK: View
    var body: some View {
        appMainBackground {
            VStack {
                LogoHeader(text: "Recuperar")
                TextFieldView(text: $viewModel.email,
                              placeholder: "E-mail")
                .padding(.top, 30)
                Button(action: {
                    viewModel.recoveryPassword()
                }, label: {
                    ButtonLabel(word: "enviar")
                        .padding()
                })
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackArrow())
        }
    }
    
    mutating func set(viewModel: RecoveryPasswordViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RecoveryWireFrame().viewController
}