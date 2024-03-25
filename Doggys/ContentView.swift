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
                Image(decorative: "logoEars")
                    .resizable()
                    .frame(width: 400, height: 250)
                Image(decorative: "text")
                    .resizable()
                    .frame(width: 160, height: 50, alignment: .center)
                    .padding(.top, -60)
                    .padding(.bottom, 50)
                
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
                .padding(.top, 150)
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
