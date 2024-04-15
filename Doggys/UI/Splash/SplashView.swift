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
            ZStack {
                Color.customMain
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    LogoView()
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
                    isActive: $viewModel.isActive) {
                    EmptyView()
                }
            )
        }
    }
    
    mutating func set(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    SplashWireFrame().viewController
}
