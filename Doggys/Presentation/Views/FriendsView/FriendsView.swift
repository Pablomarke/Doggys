//
//  FriendsView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 28/6/24.
//

import SwiftUI

struct FriendsView: View {
    var viewModel: FriendsViewModel
    
    var body: some View {
        appMainBackground {
            List {
                Text("Amigo 1")
            }
            .padding(.top)
        }
    }
}

#Preview {
    FriendsWireframe.createView()
}
