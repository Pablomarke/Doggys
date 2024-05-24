//
//  MapView.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var selectedUser: MarkerMap? = nil
    @ObservedObject var viewModel: MapViewModel
   
    // MARK: - View -
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.selfRegion,
                showsUserLocation: true,
                annotationItems: viewModel.markers) { marker in
                MapAnnotation(coordinate: marker.coordinate) {
                    CustomMapIcon()
                        .onTapGesture {
                        selectedUser = marker
                    }
                    .frame(width: 100, height: 70)
                    .foregroundColor(.customMain)
                    
                    Image(.logoIcon)
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .offset(y: -73)
                }
            }
            .id(0)
            if let user = selectedUser {
                               VStack{
                                   MapPopupView(nameProfile: user.name)
                                           .padding()
                                           .background(Color.white)
                                           .cornerRadius(20)
                                   Button("", systemImage: "x.circle.fill") {
                                       selectedUser = nil
                                   }
                                   .foregroundStyle(.red)
                           }
                           .transition(.move(edge: .top))
                           .animation(.easeInOut)
                       }
            VStack {
                Spacer()
                HStack {
                    CenterMapButton {
                        viewModel.getLocationAndCenter()
                    }
                    Spacer()
                }
                .padding([.leading, .bottom], 16)
            }
        }
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
