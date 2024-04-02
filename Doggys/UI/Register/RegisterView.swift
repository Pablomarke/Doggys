//
//  RegisterView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RegisterView: View {
    //MARK: Properties
    
    @State private var email = "e-mail"
    @State private var password = "password"
    @Environment(\.authViewModel) private var authViewModel: AuthProtocol
    @Environment(\.logViewModel) private var logViewModel: LogProtocol
    @State private var showAlert: Bool = false
    private static var viewName: String = "RegisterView"
    @State private var alertMessage: String = ""
    
    //MARK: View
    var body: some View {
        ZStack{
            Color.customGreen.ignoresSafeArea()
            VStack{
                Image(.logoEars)
                    .resizable()
                    .frame(width: 400, height: 250, alignment: .center)
                    .padding(.top, -160)
                Text("Registrar")
                    .font(.system(size: 40, weight: .light, design: .monospaced))
                    .padding(.top, -70)
                TextFieldView(text: $email)
                    .padding(.top, 30)
                SecureTextFieldView(text: $password)
                Button(action: {
                    registerUser()
                }, label: {
                    Text("Registrar")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 150,
                               height: 40)
                        .background(Color.customLightGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15,
                                x: 0,
                                y: 10)
                })
                .padding(.top, 20)
            }
        }
    }
}

private extension RegisterView {
    //MARK: Private Methods
    
    // TODO: To ViewModel
    func registerUser() {
        authViewModel.register(email: email,
                               password: password,
                               onSuccess: { user in
            logViewModel.log(screen: RegisterView.viewName,
                             action: "USER_REGISTERED")
        },
                               onFailure: { error in
            alertMessage = error.localizedDescription
            showAlert = true
        })
    }
}

#Preview {
    RegisterView()
}
