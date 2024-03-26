//
//  LoginView.swift
//  Doggys
//
//  Created by Marco Muñoz on 21/3/24.
//

import SwiftUI
import FirebaseAnalytics

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.customLightGreen.ignoresSafeArea()
            VStack(spacing: 5) {
                Image(decorative: "logoEars")
                    .resizable()
                    .frame(width: 400, 
                           height: 250)
                Image(decorative: "text")
                    .resizable()
                    .frame(width: 160, 
                           height: 50,
                           alignment: .center)
                    .padding(.top, -60)
                    .padding(.bottom, 50)

                TextFieldView(label: "Email")
                SecureTextFieldView(label: "Password")
                
                Button(action: {
                    
                }, label: {
                    
                    Text("Login")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 150, height: 40)
                        .background(Color.customGreen)
                        .cornerRadius(15)
                        .shadow(radius: 15, x: 0, y: 10)
                })
                .padding(.top, 40)
                
                Button(action: {
//                    TODO: Button action
                }, label: {
                    Text("Register")
                        .foregroundStyle(Color.customBlue)
                        .font(.title3)
                })
                .padding(.top, 150)
            }
        }
        .onAppear(perform: {
            Analytics.logEvent("Entro a la app",
                               parameters: ["message":"Arranca la app"])
        })
    }
}

#Preview {
    LoginView()
}
