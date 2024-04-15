//
//  ProfileView.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI

struct ProfileView: View {
    //MARK: - Properties -
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ProfileViewModel
    
   //MARK: - View -
    var body: some View {
        ZStack{
            Color.customMain.ignoresSafeArea()
            ScrollView {
                VStack {
                    LogoHeader(text: "Perfil")
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
                        // TODO
                    }, label: {
                        ButtonLabel(word: "Guardar")
                    })
                }
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
