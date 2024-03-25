//
//  ContentView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 21/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.customLightGreen.ignoresSafeArea()
            VStack(spacing: 5) {
                TextField("Email", text: $email)
                    .padding()
                    .frame(width:280)
                    .foregroundColor(.customBlue)
                    .background(Color.customLightBlue)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 5, y: 10)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .opacity(0.9)
                    .padding(.top, 290)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 280)
                    .foregroundColor(.customBlue)
                    .background(Color.customLightBlue)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 5, y: 10)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .opacity(0.9)
                    .padding()
                
                
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
                    
                }, label: {
                    Text("Register")
                        .foregroundStyle(.white)
                        .font(.title3)
                })
                .padding(.top, 180)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
