//
//  ProfileView.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties -
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedImage: UIImage?
    @State var isShowingImagePicker = false
    
    //MARK: - View -
    var body: some View {
        ZStack{
            Color.customLightBlue.ignoresSafeArea()
            VStack {
                if let image = selectedImage {
                    Button(action: {
                        self.isShowingImagePicker = true
                    }) {
                        Image(uiImage: image)
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Button("Seleccionar Imagen") {
                        self.isShowingImagePicker = true
                    }
                    .font(.title2)
                    .padding()
                }
                TextFieldView(text: $viewModel.dogOwner,
                              colorBackgroud: .gray)
                .padding()
                TextFieldView(text: $viewModel.nameOfDog,
                              colorBackgroud: .gray)
                TextFieldView(text: $viewModel.ageOfDog,
                              colorBackgroud: .gray)
                .padding()
                HStack{
                    VStack{
                        Text("Raza:")
                            .foregroundStyle(Color.white)
                            .font(.title3)
                        Picker(selection: $viewModel.selectedBreed) {
                            ForEach(RazaPerro.allCases,
                                    id: \.self) { breed in
                                Text(breed.rawValue.capitalized)
                            }
                        } label: {
                            Text("")
                        }
                    }
                    VStack{
                        Text("Género:")
                            .foregroundStyle(Color.white)
                            .font(.title3)
                        Picker(selection: $viewModel.selectedGender) {
                            ForEach(GeneroPerro.allCases,
                                    id: \.self) { gender in
                                Text(gender.rawValue.capitalized)
                            }
                        } label: {
                            Text("")
                        }
                    }
                }
                Text("Seleccione tipo de paseo:")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $viewModel.selectedWalk) {
                    ForEach(PaseoPerro.allCases,
                            id: \.self) { walk in
                        Text(walk.rawValue.capitalized)
                    }
                } label: {
                    Text("")
                }
                .pickerStyle(.menu)
                Text("¿Soy amigable con otros perros?")
                    .foregroundStyle(Color.white)
                    .font(.title3)
                Picker(selection: $viewModel.dofFriendly) {
                    ForEach(PerroAmigable.allCases,
                            id: \.self) { friendly in
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
            .sheet(isPresented: $isShowingImagePicker, content: {
                ImagePicker(image: self.$selectedImage)
            })
        }
    }
    
    //MARK: - Public Methods -
    mutating func set(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    ProfileWireFrame().viewController
}
