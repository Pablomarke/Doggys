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
    @State private var showAlert = false
    
    //MARK: - View -
    var body: some View {
        appMainBackground {
            ScrollView {
                VStack {
                    LogoHeader(text: "Perfil")
                        .id(0)
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
                        .id(1)
                        .font(.title2)
                    }
                    if !isShowingImagePicker {
                        Button(action: {
                            viewModel.searchImageOnRB()
                        }, label: {
                            Text("Cargar")
                        })
                        .padding()
                    }
                    TextFieldView(text: $viewModel.dogOwner)
                        .id(2)
                        .padding(5)
                    TextFieldView(text: $viewModel.nameOfDog)
                        .id(3)
                        .padding(5)
                    TextFieldView(text: $viewModel.ageOfDog)
                        .id(4)
                        .padding(5)
                    TextPickerView(selectedItem: $viewModel.selectedBreed,
                                   text: "Seleccione una raza:",
                                   items: DogBreed.allCases)
                    .id(5)
                    
                    TextPickerView(selectedItem: $viewModel.selectedGender,
                                   text: "Seleccione género:",
                                   items: DogGender.allCases)
                    .id(6)
                    
                    TextPickerView(selectedItem: $viewModel.selectedWalk,
                                   text: "Seleccione tipo de paseo:",
                                   items: DogWalkLong.allCases)
                    .id(7)
                    
                    TextPickerView(selectedItem: $viewModel.dofFriendly,
                                   text: "¿Soy amigable con otros perros?",
                                   items: DogFriendly.allCases)
                    .id(8)
                    .padding()
                    Button(action: {
                        viewModel.searchImageOnRB()
                        self.showAlert = true
                    }, label: {
                        ButtonLabel(word: "Guardar")
                    })
                    .id(9)
                    .padding()
                }
                .sheet(isPresented: $isShowingImagePicker,
                       content: {
                    ImagePicker(image: $viewModel.selectedImage)
                })
            }
            .alert(isPresented: $showAlert) {
                       Alert(title: Text("Perfil"),
                             message: Text("Datos guardados con éxito"),
                             dismissButton: .default(Text("OK")))
                   }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
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
