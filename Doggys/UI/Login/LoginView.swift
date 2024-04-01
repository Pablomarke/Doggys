//
//  LoginView.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/3/24.
//

import SwiftUI
import FirebaseAnalytics

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
                Image(decorative: "logoEars")
                    .resizable()
                    .frame(width: 400,
                           height: 250)
                Image(decorative: "text")
                    .resizable()
                    .frame(width: 160,
                           height: 50,
                           alignment: .center)
                    .padding(.top, -60)
                    .padding(.bottom, 50)
                
                TextField("email",
                          text: $email)
                .padding()
                .frame(width:280)
                .foregroundColor(.white)
                .background(Color.customLightBlue)
                .cornerRadius(20)
                .shadow(radius: 10, x: 5, y: 10)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .opacity(0.9)
                
                SecureField("password",
                            text: $password)
                .padding()
                .frame(width: 280)
                .foregroundColor(.white)
                .background(Color.customLightBlue)
                .cornerRadius(20)
                .shadow(radius: 10, x: 5, y: 10)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .opacity(0.9)
                .padding()
                
                Button(action: {
                    
                }, label: {
                    
                    Text("Login")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 40)
                        .background(Color.customGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15, x: 0, y: 10)
                })
                .padding(.top, 40)
                
                Button(action: {
                    registerUser()
                }, label: {
                    Text("Register")
                        .foregroundStyle(Color.customBlue)
                        .font(.title3)
                })
                .padding(.top, 150)
            }
        }
        .onAppear(perform: {
            Analytics.logEvent("Entro a la app",
                               parameters: ["message":"Arranca la app"])
        })
    }
    
    
    
    private func registerUser() {
        authViewModel.register(email: email, password: password, onSuccess: { user in
            logViewModel.log(screen: LoginView.viewName, action: "USER_REGISTERED")
        }, onFailure: { error in
            alertMessage = error.localizedDescription
            showAlert = true
        })
    }
}
/*
#Preview {
    LoginView()
}*/
