//
//  MarkerMap.swift
//  Doggys
//
//  Created by Marco Muñoz on 8/4/24.
//

import MapKit

typealias MarkerMapList = [MarkerMap]

struct MarkerMap: Identifiable {
    let id = UUID()
    let name: String
    var coordinate: CLLocationCoordinate2D
}
