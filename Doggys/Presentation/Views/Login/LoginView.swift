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
    @FocusState private var nameIsFocused: Bool
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: View
    var body: some View {
        NavigationView {
            appMainBackground {
                VStack() {
                    TextTitleHeader()
                        .id(0)
                    TextFieldView(text: $viewModel.email,
                                  placeholder: "E-mail")
                    .id(1)
                    .focused($nameIsFocused)
                    .padding(.top, 60)
                    SecureTextFieldView("Password",
                                        placeholder: "Password",
                                        text: $viewModel.password)
                    .id(2)
                    .focused($nameIsFocused)
                    .padding(.top, 2)
                    SwitchRemember(remember: rememberLogin,
                                   title: "Recordar") { newValue in
                        viewModel.rememberLogin(remember: newValue)
                    }
                    Button(action: {
                        viewModel.loginUser()
                    }, label: {
                        ButtonLabel(word: "Login", colorForeground: .customWhite)
                    })
                    .id(4)
                    .disabled(!viewModel.loginIsValid(email: viewModel.email,
                                                      password: viewModel.password))
                    .opacity(viewModel.loginIsValid(email: viewModel.email,
                                                    password: viewModel.password) ? 1.0 : 0.5)
                    
                    // MARK: - Navigation -
                    NavigationLink {
                        RecoveryWireFrame.createView()
                    } label: {
                        RecoveryText()
                    }
                    
                    NavigationLink { 
                        RegisterWireFrame.createView()
                    } label: {
                        RegisterText()
                    }
                    
                    if viewModel.navigateToHome {
                        NavigationLink(destination: AppTabView(),
                                       isActive: $viewModel.navigateToHome) { }
                    }
                }
            }
            .onTapGesture {
                nameIsFocused = false
            }
            
            // MARK: - Life cycle -
            .onAppear {
                viewModel.initAnalyticsFirebase(text: "App run",
                                                message: "App run")
            }
        }
        .overlay(
            viewModel.isLoading ? LoadingView() : nil
        )
        .disabled(viewModel.isLoading)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginWireFrame.createView()
}
