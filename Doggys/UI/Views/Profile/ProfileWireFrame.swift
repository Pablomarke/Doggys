//
//  ProfileWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.


import SwiftUI

final class ProfileWireFrame: BaseWireframe {
    //MARK: - Properties
    var viewController: AnyView {
        let userViewModel: UserProfileProtocol = createUserViewModel()
        let logViewModel: LogProtocol = createLogViewModel()
        let storageViewModel: StorageProtocol = createStorageViewModel()
        let viewModel: ProfileViewModel = createViewModel(userViewModel: userViewModel, logViewModel: logViewModel, storageViewModel: storageViewModel)
        var viewController = ProfileView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: - Private Methods
    private func createViewModel(userViewModel: UserProfileProtocol, 
                                 logViewModel: LogProtocol, storageViewModel: StorageProtocol) -> ProfileViewModel {
        return ProfileViewModel(userViewModel: userViewModel, 
                                logViewModel: logViewModel, storageViewModel: storageViewModel)
    }
    private func createUserViewModel() -> UserProfileProtocol {
        return FirebaseUserProfileViewModel()
    }
    private func createStorageViewModel() -> StorageProtocol {
        return FirebaseStorageViewModel()
    }
}
