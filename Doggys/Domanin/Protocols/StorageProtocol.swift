//
//  StorageProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 17/4/24.
//

import SwiftUI
import Combine

protocol StorageProtocol {
    func uploadImage(image: UIImage) -> AnyPublisher<String, Error>
}
