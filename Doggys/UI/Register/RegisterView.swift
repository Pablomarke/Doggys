//
//  RegisterView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RegisterView: View {
    //MARK: - Properties -
    static var viewName: String = "RegisterView"
    @ObservedObject var viewModel: RegisterViewModel
    @Environment(\.presentationMode) var presentationMode
   
    public init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - View -
    var body: some View {
        ZStack{
            Color.customMain.ignoresSafeArea()
            VStack {
                LogoHeader(text: "Registro")
                TextFieldView(text: $viewModel.email)
                SecureTextFieldView("Password",
                                    placeholder: "Password",
                                    text: $viewModel.password)
                    .padding(.top, 8)
                SecureTextFieldView("Repeat Password", 
                                    placeholder: "Repeat Password",
                                    text: $viewModel.repeatPassword)

                Button(action: {
                    viewModel.registerUser()
                }, label: {
                    ButtonLabel(word: "Registrar")
                })
                .padding(.top, 20)
                .disabled(!viewModel.registerValid())
                .opacity(viewModel.registerValid() ? 1.0 : 0.5)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
            Text("Atrás")
        })
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
    }
    
    //MARK: - Publics methods -
    mutating func set(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RegisterWireFrame().viewController
}
