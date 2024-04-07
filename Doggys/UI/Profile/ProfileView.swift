//
//  ProfileView.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI


struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var dogOwner = "Nombre del Humano"
    @State private var nameOfDog = "Doggy Nombre"
    @State var ageOfDog: String = "Doggy Años"
    @State private var selectedBreed = ""
    @State private var selectedGender = ""
    
    //TODO: Enum
    let dogBreed = ["Mestizo","Dobermán","Labrador","Rottweiler","Siba-Inu","Yorkshire","Bulldog", "Teckel"]
    
    let dogGender = ["Hembra", "Macho"]
   
    var body: some View {
        ZStack{
            Color.customLightBlue.ignoresSafeArea()
            VStack{
                LogoHeader(text: "Perfil",
                           toTop: -40)
                TextFieldView(text: $dogOwner,
                              colorBackgroud: .gray)
                .padding(10)
                TextFieldView(text: $nameOfDog,
                              colorBackgroud: .gray)
                .padding(10)
                TextFieldView(text: $ageOfDog,
                              colorBackgroud: .gray)
                .padding()
                
                Text("Seleccione una raza:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $selectedBreed) {
                    ForEach(dogBreed,
                            id: \.self){
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
                    ForEach(dogGender,
                            id: \.self){
                        Text($0)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                .padding()
                Button(action: {
                    // TODO
                }, label: {
                    ButtonLabel(word: "enviar")
                })
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
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
