//
//  ProfileView.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ProfileViewModel
    
    //TODO: Enum
//    let dogBreed = ["Mestizo","Dobermán","Labrador","Rottweiler","Siba-Inu","Yorkshire","Bulldog", "Teckel"]
    
    let dogGender = ["Hembra", "Macho"]
   //MARK: - View
    var body: some View {
        ZStack{
            Color.customLightBlue.ignoresSafeArea()
            VStack{
                TextFieldView(text: $viewModel.dogOwner,
                              colorBackgroud: .gray)
                .padding(10)
                TextFieldView(text: $viewModel.nameOfDog,
                              colorBackgroud: .gray)
                .padding(10)
                TextFieldView(text: $viewModel.ageOfDog,
                              colorBackgroud: .gray)
                .padding()
                
                Text("Seleccione una raza:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $viewModel.selectedBreed) {
                    ForEach(RazaPerro.allCases,
                            id: \.self){ breed in
                        Text(breed.rawValue.capitalized)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                
                Text("Seleccione género:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $viewModel.selectedGender) {
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
    //MARK: Public Methods
    mutating func set(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    ProfileWireFrame().viewController
}
