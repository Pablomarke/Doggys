//
//  RegisterView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RegisterView: View {
    //MARK: Properties
    static var viewName: String = "RegisterView"
    @ObservedObject var viewModel: RegisterViewModel
    @Environment(\.presentationMode) var presentationMode
   
    public init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: View
    var body: some View {
        ZStack{
            Color.customGreen.ignoresSafeArea()
            VStack{
                LogoHeader(text: "Registrar")
                TextFieldView(text: $viewModel.email)
                    .padding(.top, 30)
                SecureTextFieldView(text: $viewModel.password)
                Button(action: {
                    viewModel.registerUser()
                }, label: {
                    Text("Registrar")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 150,
                               height: 40)
                        .background(Color.customLightGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15,
                                x: 0,
                                y: 10)
                })
                .padding(.top, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
            Text("Atrás")
        })
    }
    mutating func set(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RegisterWireFrame().viewController
}
