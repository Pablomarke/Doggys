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
    
    @State var selectedBreed = "Mestizo"
    
    var body: some View {
        NavigationStack{
            Form() { 
                Section {
                    Picker(selection: $selectedBreed) {
                        ForEach(dogBreed, id: \.self){
                            Text($0)
                        }
                    } label: {
                        Text("Seleccione raza")
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
