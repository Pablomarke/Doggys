//
//  LoginView.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/3/24.
//

import SwiftUI

struct LoginView: View {
    //MARK: Properties
    
    @State private var isLoggedIn: Bool = false
    @Environment(\.authViewModel) private var authViewModel: AuthProtocol
    @Environment(\.logViewModel) private var logViewModel: LogProtocol
    @ObservedObject var viewModel: LoginViewModel
    @State private var alertMessage: String = ""
    @State private var email = "e-mail"
    @State private var password = "password"
    @State private var showAlert: Bool = false
    private static var viewName: String = "LoginView"
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: View
    var body: some View {
        NavigationView{
            ZStack {
                Color.customLightGreen.ignoresSafeArea()
                VStack(spacing: 5) {
                    LogoView()
                    TextFieldView(text: $email)
                    SecureTextFieldView(text: $password)
                    Button(action: {
                        //                    TODO
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
                    
                    Button {
                        recoveryPassword()
                    } label: {
                        Text("Recuperar Contraseña")
                            .padding(.top, 25)
                            .foregroundStyle(.gray)
                        
                    }
                    .padding(.bottom, 60)
                    
                    NavigationLink{
                        RegisterView()
                    }
                label:{ Text("¿Aún no tienes cuenta?")
                    .font(.title3)}
                }
            }
            .onAppear(perform: {
                viewModel.initAnalyticsFirebase()
                checkIfUserIsLoggedIn()
            })
        }
    }
}

//MARK: Private Methods
private extension LoginView {
    // TODO: To viewmodel
    
    func checkIfUserIsLoggedIn() {
        authViewModel.isUserLoggedIn(
            onSuccess: { loggedIn in
                isLoggedIn = loggedIn
            },
            onFailure: { error in
                logViewModel.crash(screen: LoginView.viewName, exception: error)
            }
        )
    }
    
    func registerUser() {
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
    
    func recoveryPassword(){
        authViewModel.recoverPassword(email: email) {
            logViewModel.log(screen: LoginView.viewName, action: "PASSWORD_RECOVERED")
            alertMessage = "Password recovery initiated"
        } onFailure: { error in
            alertMessage = error.localizedDescription
            showAlert = true
        }
        
    }
}

#Preview {
    LoginWireFrame().viewController
}
