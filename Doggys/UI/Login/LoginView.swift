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
    static var viewName: String = "LoginView"
    @State private var rememberLogin: Bool = false
    
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
                  
                    TextFieldView(text: $viewModel.email)
                        .padding(.top,
                                 60)
                    SecureTextFieldView("Password",
                                        text: $viewModel.password)
                    HStack {
                        Toggle(isOn: $rememberLogin) {
                            Text("Recordar")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: rememberLogin
                                                       ? Color.customBlue
                                                       : Color.customWhite)
                        )
                    }
                    .foregroundColor(.customWhite)
                    .padding([.leading,
                              .trailing],
                             130)
                    .onChange(of: rememberLogin) { newValue in
                        viewModel.rememberLogin = newValue
                    }
                    Spacer()
                    Button(action: {
                        viewModel.checkIfUserIsLoggedIn()
                    }, label: {
                        ButtonLabel(word: "Login")
                    })
                    .padding(.top,
                             40)
                    NavigationLink {
                        RecoveryWireFrame().viewController
                    } label: {
                        Text("Recuperar Contraseña")
                            .padding(.top,
                                     25)
                            .foregroundStyle(.gray)
                    }
                    .padding(.bottom,
                             80)
                    NavigationLink(destination: RegisterWireFrame().viewController) {
                        Text("¿Aún no tienes cuenta?")
                            .font(.title3)
                    }
                    NavigationLink(destination: AppTabView(),
                                   isActive: $viewModel.isLoggedIn) {
                        EmptyView()
                    }
                }
            }
            // MARK: - Life cycle -
            .onAppear {
                viewModel.initAnalyticsFirebase(text: "App run",
                                                message: "App run")
            }
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
    }
    
    // MARK: - Functions
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    LoginWireFrame().viewController
}
