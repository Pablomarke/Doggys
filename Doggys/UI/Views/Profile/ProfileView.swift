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
    static var viewName: String = "ProfileView"
    @State var isShowingImagePicker = false
    
    //MARK: - View -
    var body: some View {
        appMainBackground {
            ScrollView {
                VStack {
                    LogoHeader(text: "Perfil")
                        .padding(.top, 50)
                    if let image = viewModel.selectedImage {
                        Button(action: {
                            self.isShowingImagePicker = true
                        }) {
                            Image(uiImage: image)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
                                .padding(.top, -50)
                        }
                        .buttonStyle(PlainButtonStyle())
                    } else {
                        Button("Seleccionar Imagen") {
                            self.isShowingImagePicker = true
                        }
                        .padding(10)
                        .font(.title2)
                    }
                    TextFieldView(text: $viewModel.dogOwner, placeholder: "Nombre del Humano")
                        .padding(10)
                    TextFieldView(text: $viewModel.nameOfDog, placeholder: "Doggy Nombre")
                        .padding(10)
                    TextFieldView(text: $viewModel.ageOfDog, placeholder: "Doggy Edad")
                        .padding(10)
                    
                    TextPickerView(selectedItem: $viewModel.selectedBreed,
                                   text: "Seleccione una raza:",
                                   items: DogBreed.allCases)
                    
                    TextPickerView(selectedItem: $viewModel.selectedGender,
                                   text: "Seleccione género:",
                                   items: DogGender.allCases)
                    
                    TextPickerView(selectedItem: $viewModel.selectedWalk,
                                   text: "Seleccione tipo de paseo:",
                                   items: DogWalkLong.allCases)
                    
                    TextPickerView(selectedItem: $viewModel.dofFriendly,
                                   text: "¿Soy amigable con otros perros?",
                                   items: DogFriendly.allCases)
                    .padding()
                    Button(action: {
                        viewModel.searchImageOnRB()
                    }, label: {
                        ButtonLabel(word: "Guardar")
                    })
                    .padding()
                }
                .sheet(isPresented: $isShowingImagePicker, 
                       content: {
                    ImagePicker(image: $viewModel.selectedImage)
                })
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
             }
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
