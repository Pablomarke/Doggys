//
//  ProfileWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 5/4/24.
//

import SwiftUI

final class ProfileWireFrame {
    //MARK: - Properties
    var viewController: AnyView {
        let viewModel: ProfileViewModel = ProfileViewModel()
        var viewController = ProfileView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: - Private Methods
    private func createViewModel() -> ProfileViewModel {
        return ProfileViewModel()
    }
}
