//
//  LoginView.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/3/24.
//

import SwiftUI
import Combine

struct LoginView: View {
    //MARK: Properties
    @Environment(\.authViewModel) private var authViewModel: AuthProtocol
    @Environment(\.logViewModel) private var logViewModel: LogProtocol
    @ObservedObject var viewModel: LoginViewModel
    static var viewName: String = "LoginView"
    @State private var cancellables: Set<AnyCancellable> = []
    @State private var shouldNavigateToHome = false
    @State private var isLoading = false
    
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
                        .padding(.top,
                                 60)
                    SecureTextFieldView(text: $viewModel.password)
                    Button(action: {
                        isLoading = true
                        // TODO: Simula una llamada a la API, cuando esté implementado eliminar
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            viewModel.checkIfUserIsLoggedIn()
                        }
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
                    
                    NavigationLink(destination: MapViewWireFrame().viewController, 
                                   isActive: $shouldNavigateToHome) {
                        EmptyView()
                    }
                    .hidden()
                    .onDisappear {
                        isLoading = false
                    }
                }
            }
            .overlay(
                isLoading ? LoadingView() : nil
            )
            .disabled(isLoading)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                to: nil,
                                                from: nil,
                                                for: nil)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
        .onReceive(viewModel.navigateToHome) { _ in
            shouldNavigateToHome = true
        }
    }
    
    // MARK: - Functions
    func responseViewModel() {
        viewModel.navigateToHome
            .sink { _ in
                shouldNavigateToHome = true
            }
            .store(in: &cancellables)
    }
    
    mutating func set(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    LoginWireFrame().viewController
}
