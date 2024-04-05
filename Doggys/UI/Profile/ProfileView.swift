//
//  ProfileView.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI


struct ProfileView: View {
    
    //TODO: Enum
    let dogBreed = ["Mestizo","Dobermán","Labrador","Rottweiler","Siba-Inu","Yorkshire","Bulldog", "Teckel"]
    
    let dogGender = ["Hembra", "Macho"]
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dogOwner = "Nombre del Humano"
    @State private var nameOfDog = "Doggy Nombre"
    @State var ageOfDog: String = "Doggy Años"
    @State private var selectedBreed = ""
    @State private var selectedGender = ""
    
    var body: some View {
        ZStack{
            Color.customLightBlue.ignoresSafeArea()
            VStack{
                Image(.logoEars)
                    .resizable()
                    .frame(width: 400, height: 250, alignment: .center)
                    .padding(.top, -40)
                Text("Perfil")
                    .font(.system(size: 40, weight: .light, design: .monospaced))
                    .padding(.top, -70)
                TextFieldProfileView(text: $dogOwner)
                    .padding(10)
                TextFieldProfileView(text: $nameOfDog)
                    .padding(10)
                TextFieldProfileView(text: $ageOfDog)
                    .padding()
                
                
                Text("Seleccione una raza:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $selectedBreed) {
                    ForEach(dogBreed, id: \.self){
                        Text($0)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                
                Text("Seleccione género:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $selectedBreed) {
                    ForEach(dogGender, id: \.self){
                        Text($0)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                .padding()
                Button(action: {}, label: {
                    Text("Enviar")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 150,
                               height: 40)
                        .background(Color.orange)
                        .cornerRadius(15)
                        .shadow(radius: 15,
                                x: 0,
                                y: 10)
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
    
    #Preview {
        ProfileView()
    }
