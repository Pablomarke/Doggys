//
//  LoginView.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/3/24.
//

import SwiftUI

struct LoginView: View {
    //MARK: Properties
    @ObservedObject var viewModel: LoginViewModel
    static var viewName: String = "LoginView"
    @State private var rememberLogin: Bool = UserDefaults.standard.bool(forKey: Preferences.rememberLogin)
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: View
    var body: some View {
        NavigationView {
            ZStack {
                Color.customMain
                    .ignoresSafeArea()
                VStack() {
                    Text("Doggys")
                        .font(.custom("Jost-Light",
                                      size: 90))
                        .foregroundStyle(Color.customWhite)
                    
                    TextFieldView(text: $viewModel.email, placeholder: "E-mail")

                        .padding(.top,
                                 60)
                    SecureTextFieldView("Password",
                                        placeholder: "Password",
                                        text: $viewModel.password)
                    .padding(.top, 2)
                    HStack {
                        Toggle(isOn: $rememberLogin) {
                            Text("Recordar")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: rememberLogin
                                                       ? Color.customLightBlue
                                                       : Color.customWhite)
                        )
                    }
                    .foregroundColor(.customWhite)
                    .padding(.bottom, 60)
                    .padding([.leading,
                              .trailing], 130)
                    .onChange(of: rememberLogin) { newValue in
                        viewModel.rememberLogin(remember: newValue)
                    }
                    
                    Button(action: {
                        viewModel.loginUser()
                    }, label: {
                        ButtonLabel(word: "Login")
                            .padding(.bottom, 1)
                    })
                    .disabled(!viewModel.loginIsValid(email: viewModel.email,
                                                      password: viewModel.password))
                    .opacity(viewModel.loginIsValid(email: viewModel.email, 
                                                    password: viewModel.password) ? 1.0 : 0.5)
                    
                    NavigationLink {
                        RecoveryWireFrame().viewController
                    } label: {
                        Text("Recuperar Contraseña")
                            .padding(.bottom, 80)
                            .font(.custom("Jost-Light",
                                          size: 18))
                            .foregroundStyle(.customWhite)
                    }
                    
                    NavigationLink(destination: RegisterWireFrame().viewController) {
                        Text("No tengo Cuenta")
                            .font(.custom("Jost-Light",
                                          size: 24))
                            .foregroundStyle(Color.customWhite)
                    }
                    
                    if viewModel.navigateToHome {
                        NavigationLink(destination: AppTabView(),
                                       isActive: $viewModel.navigateToHome) {
                            EmptyView()
                        }
                    }
                }
            }
            // MARK: - Life cycle -
            .onAppear {
                viewModel.initAnalyticsFirebase(text: "App run",
                                                message: "App run")
            }
        }
        .overlay(
            viewModel.isLoading ?
            LoadingView() : nil
        )
        .disabled(viewModel.isLoading)
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Functions
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    LoginWireFrame().viewController
}
