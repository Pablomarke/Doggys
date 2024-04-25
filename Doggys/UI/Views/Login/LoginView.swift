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
                    TextFieldView(text: $viewModel.email,
                                  placeholder: "E-mail")
                    .focused($nameIsFocused)
                        .padding(.top, 60)
                    SecureTextFieldView("Password",
                                        placeholder: "Password",
                                        text: $viewModel.password)
                    .focused($nameIsFocused)
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
                    })
                    .disabled(!viewModel.loginIsValid(email: viewModel.email,
                                                      password: viewModel.password))
                    .opacity(viewModel.loginIsValid(email: viewModel.email, 
                                                    password: viewModel.password) ? 1.0 : 0.5)
                    
                    // MARK: - Navigation -
                    NavigationLink {
                        RecoveryWireFrame().viewController
                    } label: {
                        RecoveryText()
                    }
                    
                    NavigationLink(destination: RegisterWireFrame().viewController) {
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
    
    // MARK: - Functions
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}


#Preview {
    LoginWireFrame().viewController
}
