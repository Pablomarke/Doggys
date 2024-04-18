//
//  BaseWireframe.swift
//  Doggys
//
//  Created by Pablo Márquez Marín on 18/4/24.
//

import Foundation

class BaseWireframe {
    func createAutViewModel() -> AuthProtocol {
        return FirebaseAuthViewModel()
    }
    
    func createLogViewModel() -> LogProtocol {
        return FirebaseLogViewModel()
    }
    
    func createkeyChain() -> KeyChainDataProvider {
        return KeyChainDataProvider()
    }
}
