//
//  MapView.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var viewModel: MapViewModel
    // MARK: - View -
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.region,
                annotationItems: viewModel.markers) { marker in
                MapAnnotation(coordinate: marker.coordinate) {
                    MapMarkerIcon(name: marker.name)
                }
            }
        }
        // MARK: - Lifecycle -
        .onAppear {
            viewModel.chargeData()
        }
    }
    
    mutating func set(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    AppTabView()
}
