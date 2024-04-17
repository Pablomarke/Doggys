//
//  SplashViewModel.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 2/4/24.
//

import Foundation

final class SplashViewModel: ObservableObject {
    // MARK: - Properties -
    @Published var isActive = false

    // MARK: - Public methods -
    func initView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isActive = true
        }
    }
}
