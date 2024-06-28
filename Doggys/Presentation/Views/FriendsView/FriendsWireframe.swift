//
//  FriendsWireframe.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 28/6/24.
//

import SwiftUI

enum FriendsWireframe {
    static func createView() -> some View {
        let viewModel: FriendsViewModel = FriendsViewModel()
        let view: FriendsView = FriendsView(viewModel: viewModel)
        return view
    }
}
