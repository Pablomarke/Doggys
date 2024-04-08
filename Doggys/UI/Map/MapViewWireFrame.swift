//
//  MapWireFrame.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI

final class MapViewWireFrame {
    //MARK: Public Methods
    var viewController: AnyView {
        let viewModel: MapViewModel = MapViewModel()
        var viewController = MapView(viewModel: viewModel)
        viewController.set(viewModel: viewModel)
        return AnyView(viewController)
    }
    
    //MARK: Private Methods
    private func createViewModel() -> SplashViewModel {
        return SplashViewModel()
    }
}
