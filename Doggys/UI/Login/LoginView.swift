//
//  LoginView.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/3/24.
//

import SwiftUI

struct LoginView: View {
    //MARK: Properties
    @Environment(\.authViewModel) private var authViewModel: AuthProtocol
    @Environment(\.logViewModel) private var logViewModel: LogProtocol
    @ObservedObject var viewModel: LoginViewModel
    @State private var alertMessage: String = ""
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert: Bool = false
    private static var viewName: String = "LoginView"
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.customLightGreen.ignoresSafeArea()
            VStack(spacing: 5) {
                LogoView()
                TextFieldView(label: "E-mail",
                              text: $email)
                
                SecureTextFieldView(label: "password",
                                    text: $password)
                Button(action: {
                    
                }, label: {
                    Text("Login")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 150, 
                               height: 40)
                        .background(Color.customGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15, 
                                x: 0,
                                y: 10)
                })
                .padding(.top, 
                         40)
                
                Button(action: {
                    registerUser()
                }, label: {
                    Text("Register")
                        .foregroundStyle(Color.customBlue)
                        .font(.title3)
                })
                .padding(.top, 
                         150)
            }
        }
        .onAppear(perform: {
            viewModel.initAnalyticsFirebase()
        })
    }

    private func registerUser() {
        authViewModel.register(email: email,
                               password: password,
                               onSuccess: { user in
            logViewModel.log(screen: LoginView.viewName,
                             action: "USER_REGISTERED")
        },
                               onFailure: { error in
            alertMessage = error.localizedDescription
            showAlert = true
        })
    }
}

#Preview {
    LoginWireFrame().viewController
}
