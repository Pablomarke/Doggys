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
        ZStack{
            Color.customMain.ignoresSafeArea()
            ScrollView {
                VStack {
                    LogoHeader(text: "Perfil")
                    if let image = viewModel.selectedImage {
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
                    if !isShowingImagePicker {
                        Button(action: {
                            viewModel.searchImageOnRB()
                        }, label: {
                            Text("Cargar")
                        })
                    }
                    TextFieldView(text: $viewModel.dogOwner)
                        .padding(5)
                    TextFieldView(text: $viewModel.nameOfDog)
                        .padding(5)
                    TextFieldView(text: $viewModel.ageOfDog)
                        .padding(5)
                    
                    TextPickerView(selectedItem: $viewModel.selectedBreed,
                                   text: "Seleccione una raza:",
                                   items: RazaPerro.allCases)
                    
                    TextPickerView(selectedItem: $viewModel.selectedGender,
                                   text: "Seleccione género:",
                                   items: GeneroPerro.allCases)
                    
                    TextPickerView(selectedItem: $viewModel.selectedWalk,
                                   text: "Seleccione tipo de paseo:",
                                   items: PaseoPerro.allCases)
                    
                    TextPickerView(selectedItem: $viewModel.dofFriendly,
                                   text: "¿Soy amigable con otros perros?",
                                   items: PerroAmigable.allCases)
                    .padding()
                    Button(action: {
                        viewModel.searchDataOnDB()
                    }, label: {
                        ButtonLabel(word: "Guardar")
                    })
                }
                .sheet(isPresented: $isShowingImagePicker, content: {
                    ImagePicker(image: $viewModel.selectedImage)
                })
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
