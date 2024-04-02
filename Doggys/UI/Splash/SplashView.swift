//
//  SplashView.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    static var viewName: String = "SplashView"
    @State private var isActive = false
    
    public init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customGreenblue
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    LogoView().background(Color.customGreenblue)
                    Spacer()
                    ProgressView()                    .scaleEffect(3.0)
                    Spacer()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isActive = true
                }
            }
            .background(
                NavigationLink(
                    destination: RegisterView(),
                    isActive: $isActive
                ) {
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
    SplashView(viewModel: SplashViewModel())
}
