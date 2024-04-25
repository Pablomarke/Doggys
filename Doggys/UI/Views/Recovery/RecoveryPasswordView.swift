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
    @State private var showAlert = false
    
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
                    self.showAlert = true
                }, label: {
                    ButtonLabel(word: "enviar")
                        .padding()
                })
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackArrow())
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
         }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Recuperar"),
                  message: Text("E-mail de recuperación enviado"),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    mutating func set(viewModel: RecoveryPasswordViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RecoveryWireFrame().viewController
}
