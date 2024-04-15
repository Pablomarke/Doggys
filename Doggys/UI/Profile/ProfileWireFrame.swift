//
//  ProfileWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.


import SwiftUI

final class ProfileWireFrame {
    //MARK: - Properties
    var viewController: AnyView {
        let userViewModel: UserProfileProtocol = createUserViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let viewModel: ProfileViewModel = createViewModel(userViewModel: userViewModel, logViewModel: logViewModel)
        var viewController = ProfileView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: - Private Methods
    private func createViewModel(userViewModel: UserProfileProtocol, logViewModel: LogProtocol) -> ProfileViewModel {
        return ProfileViewModel(userViewModel: userViewModel, logViewModel: logViewModel)
    }
    private func createUserViewModel() -> UserProfileProtocol {
        return FirebaseUserProfileViewModel()
    }
    
    private func createLogViewModel() -> LogProtocol {
        return FirebaseLogViewModel()
    }
}
