//
//  LogViewModelEnvironmentKey.swift
//  Doggys
//
//  Created by Marco Muñoz on 27/3/24.
//

import SwiftUI

struct LogViewModelEnvironmentKey: EnvironmentKey {
    static let defaultValue: LogProtocol = FirebaseLogViewModel()
}

extension EnvironmentValues {
    var logViewModel: LogProtocol {
        get { self[LogViewModelEnvironmentKey.self] }
        set { self[LogViewModelEnvironmentKey.self] = newValue }
    }
}
