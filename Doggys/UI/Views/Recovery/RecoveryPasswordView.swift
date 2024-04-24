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
                    .id(0)
                TextFieldView(text: $viewModel.email,
                              placeholder: "E-mail")
                .id(1)
                .padding(.top, 30)
                Button(action: {
                    viewModel.recoveryPassword()
                }, label: {
                    ButtonLabel(word: "enviar")
                        .padding()
                })
                .id(2)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackArrow())
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
         }
    }
    
    mutating func set(viewModel: RecoveryPasswordViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RecoveryWireFrame().viewController
}
