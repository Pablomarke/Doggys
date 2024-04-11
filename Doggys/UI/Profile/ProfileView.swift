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
    
   //MARK: - View
    var body: some View {
        ZStack{
            Color.customLightBlue.ignoresSafeArea()
            VStack{
                Text("Perfil")
                    .font(.system(size: 40,
                                  weight: .light,
                                  design: .monospaced))
                    .padding()
                TextFieldView(text: $viewModel.dogOwner,
                              colorBackgroud: .gray)
                .padding(10)
                TextFieldView(text: $viewModel.nameOfDog,
                              colorBackgroud: .gray)
                .padding(10)
                TextFieldView(text: $viewModel.ageOfDog,
                              colorBackgroud: .gray)
                .padding(10)
                Text("Seleccione una raza:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                    .padding(.top, 20)
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
                    ForEach(GeneroPerro.allCases,
                            id: \.self){ gender in
                        Text(gender.rawValue.capitalized)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                Text("Seleccione tipo de paseo:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $viewModel.selectedWalk) {
                    ForEach(PaseoPerro.allCases,
                            id: \.self){ walk in
                        Text(walk.rawValue.capitalized)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                Text("¿Soy Amigable con otros perros?")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $viewModel.dofFriendly) {
                    ForEach(PerroAmigable.allCases,
                            id: \.self){ friendly in
                        Text(friendly.rawValue.capitalized)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)

                Button(action: {
                    // TODO
                }, label: {
                    ButtonLabel(word: "Guardar")
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
