//
//  StorageProtocol.swift
//  Doggys
//
//  Created by Marco Muñoz on 17/4/24.
//

import Foundation
import SwiftUI

protocol StorageProtocol {
    func uploadImage(image: UIImage, onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void)
}
