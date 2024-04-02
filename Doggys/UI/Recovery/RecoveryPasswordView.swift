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
                    .frame(width: 400, height: 250)
                    .padding(.top, -150)
                TextFieldView(text: $email)
                    .padding()
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
