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
    @State private var showAlert = false
    
    public init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - View -
    var body: some View {
        appMainBackground {
            VStack {
                LogoHeader(text: "Registro")
                    .id(0)
                TextFieldView(text: $viewModel.email,
                              placeholder: "E-mail")
                .id(1)
                SecureTextFieldView("Password",
                                    placeholder: "Password",
                                    text: $viewModel.password)
                .id(2)
                .padding(.top, 8)
                SecureTextFieldView("Repeat Password",
                                    placeholder: "Repeat Password",
                                    text: $viewModel.repeatPassword)
                .id(3)
                
                Button(action: {
                    viewModel.registerUser()
                    self.showAlert = true
                }, label: {
                    ButtonLabel(word: "Registrar", colorForeground: .customWhite)
                })
                .id(4)
                .padding(.top, 20)
                .disabled(!viewModel.registerValid())
                .opacity(viewModel.registerValid() ? 1.0 : 0.5)
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Registro"),
                      message: Text("Registro completado con éxito"),
                      dismissButton: .default(Text("OK"),
                                              action: {
                    viewModel.navigateToProfile = true
                }))
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackArrow())
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
        if viewModel.navigateToProfile {
            NavigationLink(destination: ProfileWireFrame.createView(),
                           isActive: $viewModel.navigateToProfile) { }
        }
    }
}

#Preview {
    RegisterWireFrame.createView()
}
