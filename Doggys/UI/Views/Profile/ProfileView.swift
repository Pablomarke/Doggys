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
                    TextFieldView(text: $viewModel.dogOwner, placeholder: "Nombre del Humano")
                        .onChange(of: viewModel.dogOwner) { newValue in
                            viewModel.dogOwner = viewModel.filterText(newValue)
                        }
                        .id(2)
                        .padding(10)
                    TextFieldView(text: $viewModel.nameOfDog, placeholder: "Doggy Nombre")
                        .onChange(of: viewModel.nameOfDog) { newValue in
                            viewModel.nameOfDog = viewModel.filterText(newValue)
                        }
                        .id(3)
                        .padding(10)
                    TextFieldView(text: $viewModel.ageOfDog, placeholder: "Doggy Edad")
                        .onChange(of: viewModel.ageOfDog) { newValue in
                            viewModel.ageOfDog = viewModel.filterText(newValue)
                        }
                        .id(4)
                        .padding(10)
                    
                    TextPickerView(selectedItem: $viewModel.selectedBreed,
                                   items: DogBreed.allCases)
                    .id(5)
                    
                    TextPickerView(selectedItem: $viewModel.selectedGender,
                                   items: DogGender.allCases)
                    .id(6)
                    .padding()
                    
                    TextPickerView(selectedItem: $viewModel.selectedWalk,
                                   items: DogWalkLong.allCases)
                    .id(7)
                    
                    TextPickerView(selectedItem: $viewModel.dofFriendly,
                                   items: DogFriendly.allCases)
                    .id(8)
                    .padding()
                    Button(action: {
                        viewModel.searchImageOnRB()
                        self.showAlert = true
                    }, label: {
                        ButtonLabel(word: "Guardar", colorForeground: viewModel.isButtonDisabled ? Color.gray : Color.customWhite)
                    })
                    .disabled(viewModel.isButtonDisabled)
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
                             dismissButton: .default(Text("OK"), action: {
                           viewModel.isLoading = true
                           viewModel.navigateToHome = true
                       }))
                   }
            .onAppear {
                viewModel.getLocation()
            }
            if viewModel.navigateToHome {
                NavigationLink(destination: AppTabView(),
                               isActive: $viewModel.navigateToHome) { }
            }
            
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
        }
        .overlay(
            viewModel.isLoading ? LoadingView() : nil
        )
        .disabled(viewModel.isLoading)
        .navigationBarBackButtonHidden(true)
    }
    //MARK: - Public Methods -
    mutating func set(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    ProfileWireFrame().viewController
}
