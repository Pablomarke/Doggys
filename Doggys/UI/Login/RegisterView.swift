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
            Color.customGreenblue.ignoresSafeArea()
            VStack{
                Image(.text)
                    .resizable()
                    .frame(width: 150, height: 50)
                    .padding(.top, -30)
                
                TextFieldView(text: $email)
                    .padding(.top, 100)
                SecureTextFieldView(text: $password)
                    .padding(.top, 25)
                
                Button(action: {
                    registerUser()
                }, label: {
                    Text("Registrar")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 150,
                               height: 40)
                        .background(Color.customGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15,
                                x: 0,
                                y: 10)
                })
                .padding(.top, 60)
            }
        }
    }
}

private extension RegisterView {
    //MARK: Private Methods
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
