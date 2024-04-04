//
//  RecoveryPasswordView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RecoveryPasswordView: View {
    //MARK: Properties
    
    @ObservedObject var viewModel: RecoveryPasswordViewModel
    @Environment(\.presentationMode) var presentationMode
    static var viewName: String = "RecoveryPasswordView"
    
    //MARK: View
    var body: some View {
        ZStack{
            Color.customGreen.ignoresSafeArea()
            VStack{
                Image(.logoEars)
                    .resizable()
                    .frame(width: 400, height: 250, alignment: .center)
                    .padding(.top, -210)
                Text("Recuperar")
                    .font(.system(size: 40, weight: .light, design: .monospaced))
                    .padding(.top, -70)
                TextFieldView(text: $viewModel.email)
                    .padding(.top, 60)
                Button(action: {
                    viewModel.recoveryPassword()
                }, label: {
                    Text("Enviar")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 150,
                               height: 40)
                        .background(Color.customLightGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15,
                                x: 0,
                                y: 10)
                        .padding()
                })
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                Text("Atrás")
            })
        }
    }
    
    mutating func set(viewModel: RecoveryPasswordViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    RecoveryWireFrame().viewController
}
