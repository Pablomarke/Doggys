//
//  MarkerMap.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import MapKit

struct MarkerMap: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
