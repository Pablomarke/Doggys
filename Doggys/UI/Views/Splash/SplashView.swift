//
//  SplashView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import SwiftUI

struct SplashView: View {
    //MARK: - Properties -
    @ObservedObject var viewModel: SplashViewModel
    static var viewName: String = "SplashView"
    
    public init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View -
    var body: some View {
        NavigationView {
            appMainBackground {
                VStack {
                    Spacer()
                    LogoView()
                        .id(0)
                    Spacer()
                }
            }
            
            // MARK: - Life cycle -
            .onAppear {
                viewModel.initView()
            }
            
            // MARK: - Navigation -
            .background(
                NavigationLink(
                    destination: LoginWireFrame().viewController,
                    isActive: $viewModel.navigateToLogin) {
                        EmptyView()
                    }
            )
            .background(
                NavigationLink(
                    destination: AppTabView(),
                    isActive: $viewModel.navigateToHome) {
                        EmptyView()
                    }
            )
        }
    }
    /*
    mutating func set(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }*/
}

#Preview {
    SplashWireFrame.createView()
}
