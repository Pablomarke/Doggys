//
//  ProfileViewModel.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    //MARK: Properties
    @Published var dogOwner: String = "Nombre del Humano"
    @Published var nameOfDog: String = "Doggy Nombre"
    @Published var ageOfDog: String = "Doggy Años"
    @Published var selectedBreed: RazaPerro = .mestizo
    @Published var selectedGender: GeneroPerro = .hembra
    @Published var selectedWalk: PaseoPerro = .corto
    @Published var dofFriendly: PerroAmigable = .si
}
