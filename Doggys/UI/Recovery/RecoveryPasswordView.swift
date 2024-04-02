//
//  RecoveryPasswordView.swift
//  Doggys
//
//  Created by Marco Muñoz on 2/4/24.
//

import SwiftUI

struct RecoveryPasswordView: View {
    //MARK: Properties
    
    @State private var email = "e-mail"
    @Environment(\.authViewModel) private var authViewModel: AuthProtocol
    @Environment(\.logViewModel) private var logViewModel: LogProtocol
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert: Bool = false
    private static var viewName: String = "RecoveryPasswordView"
    @State private var alertMessage: String = ""
    
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
                TextFieldView(text: $email)
                    .padding(.top, 60)
                Button(action: {
                    recoveryPassword()
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
}
    

private extension RecoveryPasswordView{
    //MARK: Private Methods
    
    // TODO: To ViewModel
    func recoveryPassword(){
        authViewModel.recoverPassword(email: email) {
            logViewModel.log(screen: RecoveryPasswordView.viewName, action: "PASSWORD_RECOVERED")
            alertMessage = "Password recovery initiated"
        } onFailure: { error in
            alertMessage = error.localizedDescription
            showAlert = true
        }
    }
}

#Preview {
    RecoveryPasswordView()
}
