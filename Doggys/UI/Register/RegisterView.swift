//
//  RegisterView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RegisterView: View {
    //MARK: Properties
    static var viewName: String = "RegisterView"
    @ObservedObject var viewModel: RegisterViewModel
    @Environment(\.presentationMode) var presentationMode
   
    public init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: View
    var body: some View {
        ZStack{
            Color.customGreen.ignoresSafeArea()
            VStack{
                LogoHeader(text: "Registrar")
                TextFieldView(text: $viewModel.email)
                SecureTextFieldView("Password", placeholder: "Password", text: $viewModel.password)
                    .padding(.top, 8)
                SecureTextFieldView("Repeat Password", placeholder: "Repeat Password", text: $viewModel.repeatPassword)
                Button(action: {
                    viewModel.registerUser()
                }, label: {
                    ButtonLabel(word: "Registrar")
                })
                .padding(.top, 20)
                .disabled(!viewModel.passwordVerify())
                .opacity(viewModel.passwordVerify() ? 1.0 : 0.5)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
            Text("Atrás")
        })
    }
    mutating func set(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RegisterWireFrame().viewController
}
