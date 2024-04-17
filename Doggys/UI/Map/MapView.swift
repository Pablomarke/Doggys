//
//  MapView.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @ObservedObject var viewModel: MapViewModel = MapViewModel()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.region,
                annotationItems: viewModel.markers) { marker in
                MapAnnotation(coordinate: marker.coordinate) {
                    Image(systemName: "mappin")
                        .foregroundColor(.orange)
                    Text(marker.name)
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.centerMapOnInitialPosition()
                    }, label: {
                        Image(systemName: "location.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.customLightBlue)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    })
                    .padding()
                    .padding(.bottom, 24)
                }
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
    }
    
    mutating func set(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    MapView()
}
