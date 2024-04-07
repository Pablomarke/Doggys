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
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: View
    var body: some View {
        NavigationView {
            ZStack {
                Color.customGreenblue.ignoresSafeArea()
                VStack(spacing: 5) {
                    LogoAppDetailView()
                        .padding()
                    TextFieldView(text: $viewModel.email)
                        .padding(.top, 60)
                    SecureTextFieldView(text: $viewModel.password)
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
                    
                    NavigationLink{
                        RegisterWireFrame().viewController
                    }
                label: {
                    Text("¿Aún no tienes cuenta?")
                        .font(.title3)
                }
                }
            }
            // MARK: - Life cycle -
            .onAppear(perform: {
                viewModel.initAnalyticsFirebase()
                viewModel.checkIfUserIsLoggedIn()
            })
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
    }
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    LoginWireFrame().viewController
}
