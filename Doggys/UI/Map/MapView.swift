//
//  MapView.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.414315106259174,
                                                                                  longitude: -3.689848595545417),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.3,
                                                                          longitudeDelta: 0.3))
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MapView()
}
