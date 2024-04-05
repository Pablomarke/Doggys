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
    
    @State private var selectedBreed = 0
    
    var body: some View {
        ZStack{
            Color.customLightBlue.ignoresSafeArea()
            VStack{
                Picker("Selecione una raza", selection: $selectedBreed) {
                    ForEach(0..<dogBreed.count) {
                        Text(self.dogBreed[$0])
                    }
                }
                .pickerStyle(InlinePickerStyle())
                .padding()
            }
        }
    }
}

#Preview {
    ProfileView()
}
